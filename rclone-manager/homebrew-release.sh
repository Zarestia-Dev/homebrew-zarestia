#!/bin/bash

# Homebrew Cask Release Script for RClone Manager
# This script generates Homebrew cask files for both architectures

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

APP_NAME="rclone-manager"
AUTHOR="Zarestia-Dev"
REPO="rclone-manager"
BUNDLE_NAME="RClone Manager"

# Get latest version from GitHub API
echo -e "${GREEN}Fetching latest version from GitHub...${NC}"
VERSION=$(curl -s "https://api.github.com/repos/${AUTHOR}/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')

if [ -z "$VERSION" ]; then
    echo -e "${RED}Error: Could not fetch latest version from GitHub API${NC}"
    exit 1
fi

echo -e "${GREEN}=== Homebrew Cask Release Script ===${NC}"
echo -e "Version: ${YELLOW}${VERSION}${NC}"
echo ""

# Define GitHub variables
GITHUB_ASSET_PREFIX="RClone.Manager"
ARM64_DMG_FILE="${GITHUB_ASSET_PREFIX}_${VERSION}_aarch64.dmg"
X64_DMG_FILE="${GITHUB_ASSET_PREFIX}_${VERSION}_x64.dmg"
ARM64_DMG_URL="https://github.com/${AUTHOR}/${REPO}/releases/download/v${VERSION}/${ARM64_DMG_FILE}"
X64_DMG_URL="https://github.com/${AUTHOR}/${REPO}/releases/download/v${VERSION}/${X64_DMG_FILE}"

# Define local paths
ARM64_DMG_PATH="/tmp/${ARM64_DMG_FILE}"
X64_DMG_PATH="/tmp/${X64_DMG_FILE}"
HOMEBREW_OUTPUT_DIR="../Casks"
HOMEBREW_CASK_FILE="${HOMEBREW_OUTPUT_DIR}/rclone-manager.rb"
HOMEBREW_TEMPLATE_FILE="./rclone-manager.rb.template"

# Download DMG files
echo -e "${GREEN}Downloading DMG files from GitHub releases (v${VERSION})...${NC}"

echo "Downloading ARM64 DMG..."
curl -sL --fail -o "$ARM64_DMG_PATH" "$ARM64_DMG_URL" || {
    echo -e "${RED}Error: Failed to download ARM64 DMG from GitHub${NC}"
    echo "URL: $ARM64_DMG_URL"
    echo "Make sure the release v${VERSION} exists and assets are uploaded."
    exit 1
}

echo "Downloading x64 DMG..."
curl -sL --fail -o "$X64_DMG_PATH" "$X64_DMG_URL" || {
    echo -e "${RED}Error: Failed to download x64 DMG from GitHub${NC}"
    echo "URL: $X64_DMG_URL"
    exit 1
}

echo -e "${GREEN}✓ ARM64 DMG downloaded successfully${NC}"
echo -e "${GREEN}✓ x64 DMG downloaded successfully${NC}"
echo ""

# Calculate SHA256 checksums
echo -e "${GREEN}Calculating SHA256 checksums...${NC}"
ARM64_SHA256=$(shasum -a 256 "$ARM64_DMG_PATH" | awk '{print $1}')
X64_SHA256=$(shasum -a 256 "$X64_DMG_PATH" | awk '{print $1}')

echo -e "ARM64 SHA256: ${YELLOW}${ARM64_SHA256}${NC}"
echo -e "x64 SHA256: ${YELLOW}${X64_SHA256}${NC}"
echo ""

# Create the Homebrew output directory if it doesn't exist
mkdir -p "$HOMEBREW_OUTPUT_DIR"

# Check if template exists
if [ ! -f "$HOMEBREW_TEMPLATE_FILE" ]; then
    echo -e "${RED}Error: Template file not found at ${HOMEBREW_TEMPLATE_FILE}${NC}"
    exit 1
fi

# Generate the cask file from template
echo -e "${GREEN}Generating Homebrew cask file from template...${NC}"

# Read template and replace placeholders
CASK_CONTENT=$(sed "s/{{VERSION}}/${VERSION}/g" "$HOMEBREW_TEMPLATE_FILE")
CASK_CONTENT=$(echo "$CASK_CONTENT" | sed "s/{{ARM64_SHA256}}/${ARM64_SHA256}/g")
CASK_CONTENT=$(echo "$CASK_CONTENT" | sed "s/{{X64_SHA256}}/${X64_SHA256}/g")

# Write to main cask file
echo "$CASK_CONTENT" > "$HOMEBREW_CASK_FILE"

# Write versioned backup (matching Homebrew @version convention)
VERSIONED_CASK_FILE="${HOMEBREW_OUTPUT_DIR}/rclone-manager@${VERSION}.rb"
VERSIONED_CASK_CONTENT=$(echo "$CASK_CONTENT" | sed "s/cask \"rclone-manager\"/cask \"rclone-manager@${VERSION}\"/")
echo "$VERSIONED_CASK_CONTENT" > "$VERSIONED_CASK_FILE"

echo -e "${GREEN}✓ Main cask file generated: ${HOMEBREW_CASK_FILE}${NC}"
echo -e "${GREEN}✓ Versioned cask created: ${VERSIONED_CASK_FILE}${NC}"
echo ""

# Create a checksum info file for reference
CHECKSUMS_FILE="./checksums.txt"
cat > "$CHECKSUMS_FILE" <<EOF
RClone Manager v${VERSION} Checksums
======================================

ARM64 (Apple Silicon):
  File: ${ARM64_DMG_FILE}
  SHA256: ${ARM64_SHA256}

Intel (x86_64):
  File: ${X64_DMG_FILE}
  SHA256: ${X64_SHA256}
EOF

echo -e "${GREEN}✓ Checksum file generated: ${CHECKSUMS_FILE}${NC}"
echo ""

# Display the cask file content
echo -e "${GREEN}=== Generated Cask File ===${NC}"
cat "$HOMEBREW_CASK_FILE"
echo ""

# List all versioned casks
echo -e "${GREEN}=== Historical Cask Versions ===${NC}"
if [ -n "$(ls -A ${HOMEBREW_OUTPUT_DIR}/rclone-manager@*.rb 2>/dev/null)" ]; then
    echo "Found $(ls -1 ${HOMEBREW_OUTPUT_DIR}/rclone-manager@*.rb 2>/dev/null | wc -l | tr -d ' ') versioned cask file(s):"
    ls -1t "${HOMEBREW_OUTPUT_DIR}"/rclone-manager@*.rb 2>/dev/null | while read -r file; do
        filename=$(basename "$file")
        version=$(echo "$filename" | sed 's/rclone-manager@\(.*\)\.rb/\1/')
        size=$(du -h "$file" | awk '{print $1}')
        echo -e "  ${YELLOW}• v${version}${NC} (${size})"
    done
else
    echo "  No versioned cask files found"
fi
echo ""

# Instructions
echo -e "${GREEN}=== Next Steps ===${NC}"
echo ""
echo "1. Test the cask locally:"
echo -e "   ${YELLOW}brew install --cask --debug ${HOMEBREW_CASK_FILE}${NC}"
echo ""
echo "2. Attach the checksums file to your GitHub Release (optional):"
echo -e "   ${YELLOW}gh release upload v${VERSION} ${CHECKSUMS_FILE}${NC}"
echo ""
echo "3. Audit and style check:"
echo -e "   ${YELLOW}brew audit --cask --online ${HOMEBREW_CASK_FILE}${NC}"
echo -e "   ${YELLOW}brew style --cask ${HOMEBREW_CASK_FILE}${NC}"
echo ""
echo "4. Commit and push the updated cask files in Casks/ to your tap repository"
echo ""

# Clean up temporary downloads
echo -e "${GREEN}Cleaning up temporary files...${NC}"
rm -f "$ARM64_DMG_PATH" "$X64_DMG_PATH"

echo -e "${GREEN}=== Script Complete ===${NC}"
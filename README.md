# Zarestia's Homebrew Tap

This repository contains **Homebrew Casks** for various tools and applications developed by **Zarestia-Dev**.

---

## 📦 Getting Started

### Step 1 – Tap the repository

To add this tap to your Homebrew installation, run:

```bash
brew tap Zarestia-Dev/zarestia
```

### Step 2 - Trust the repository

To trust the repository, run:

```bash
brew trust zarestia-dev/zarestia
```

### Step 3 – Install a tool

You can then install any of the following available casks:

#### **RClone Manager**
A GUI manager for RClone built with Angular and Tauri.

```bash
brew install --cask rclone-manager
```

---

## 🛠 Available Casks

| Cask | Description | Install Command |
| :--- | :--- | :--- |
| `rclone-manager` | GUI for RClone | `brew install --cask rclone-manager` |

---

## ⚠️ macOS Security Notice

Most applications in this tap are **open-source and unsigned**. macOS will likely block them by default with warnings like:

> "App" can't be opened because it is from an unidentified developer.
> "App" is damaged and can’t be opened.

### ✅ How to bypass Gatekeeper

If you trust the application, you can allow it to run by running the following command in your terminal:

```bash
# Example for RClone Manager
xattr -cr "/Applications/RClone Manager.app"
```

Alternatively, you can **Right-click** the application in `/Applications` and select **Open**, then confirm in the dialog.

---

## 🔄 Updating Tools

To update all installed tools from this tap to their latest versions:

```bash
brew update
brew upgrade --cask rclone-manager
```

---

## 📌 Important Notes

- This tap is community-driven and maintained by **Zarestia-Dev**.
- Apps are unsigned and not notarized, so Gatekeeper warnings are expected.
- Contributions and feedback are welcome!

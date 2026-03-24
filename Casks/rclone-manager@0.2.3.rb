# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.2.3" do
  version "0.2.3"
  on_arm do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
    sha256 "37ab686693c11835992344e3d02bde826a2976f37ce20e66c640b40769897f01"
  end
  on_intel do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_x64.dmg"
    sha256 "e357c4ecf3f2b522ae904404892cf9928076d36c09fa54f94fed4568cd67856c"
  end
  name "RClone Manager"
  desc "GUI for rclone built with Angular and Tauri"
  homepage "https://github.com/Zarestia-Dev/rclone-manager"
  depends_on macos: ">= :ventura" # macOS 13
  postflight do
    system "xattr -cr com.apple.quarantine #{appdir}/RClone Manager.app"
  end
  app "RClone Manager.app"
  zap trash: [
    "~/Library/Application Support/io.github.zarestia_dev.rclone-manager",
    "~/Library/Caches/io.github.zarestia_dev.rclone-manager",
    "~/Library/Preferences/io.github.zarestia_dev.rclone-manager.plist",
    "~/Library/Saved Application State/io.github.zarestia_dev.rclone-manager.savedState",
  ]
end

# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.3.0" do
  version "0.3.0"
  on_arm do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
    sha256 "8896050665ae9e034c916e43defd706d78d01d56843c9fa3d5ce0d10ab6bf864"
  end
  on_intel do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_x64.dmg"
    sha256 "35a70448ab4e912ac500bb2da2158112d6c58ac62c78d9f9abdbb8cb6f2019b6"
  end
  name "RClone Manager"
  desc "GUI for rclone built with Angular and Tauri"
  homepage "https://github.com/Zarestia-Dev/rclone-manager"
  depends_on macos: :ventura # macOS 13
  postflight do
    system "/usr/bin/xattr", "-rd", "com.apple.quarantine", "#{appdir}/RClone Manager.app"
  end
  app "RClone Manager.app"
  zap trash: [
    "~/Library/Application Support/io.github.zarestia_dev.rclone-manager",
    "~/Library/Caches/io.github.zarestia_dev.rclone-manager",
    "~/Library/Preferences/io.github.zarestia_dev.rclone-manager.plist",
    "~/Library/Saved Application State/io.github.zarestia_dev.rclone-manager.savedState",
  ]
end

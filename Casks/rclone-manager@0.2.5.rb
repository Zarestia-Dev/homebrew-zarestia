# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.2.5" do
  version "0.2.5"
  on_arm do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
    sha256 "636ea78a61540f3650edc6a7d98690ce2868880c9ed5b772f3979c3486aa1ef2"
  end
  on_intel do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_x64.dmg"
    sha256 "836d7fb4a4210656f0c946a7bdb333ad91ed329014de35e09c8dcc4f7f27c11f"
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

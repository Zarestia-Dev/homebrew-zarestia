# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.3.3" do
  version "0.3.3"

  on_arm do
    sha256 "c00249f6455bdb781c5207ee15f4135b4d1c8d0562376565bc923acc2268d3e7"

    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "2abdf42714b0525ab6f40cf4b0d5b2e33ea47f542ffe32c6035c54f7efc21155"

    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_x64.dmg"
  end

  name "RClone Manager"
  desc "GUI for rclone built with Angular and Tauri"
  homepage "https://github.com/Zarestia-Dev/rclone-manager"

  depends_on macos: :ventura # macOS 13

  app "RClone Manager.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/RClone Manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/io.github.zarestia_dev.rclone-manager",
    "~/Library/Caches/io.github.zarestia_dev.rclone-manager",
    "~/Library/Preferences/io.github.zarestia_dev.rclone-manager.plist",
    "~/Library/Saved Application State/io.github.zarestia_dev.rclone-manager.savedState",
  ]
end

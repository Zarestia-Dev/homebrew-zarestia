# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.2.9" do
  version "0.2.9"

  on_arm do
    sha256 "afca262125f51655ad4fdab5d98df5e238b4b402960d28d521275009903f037f"

    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "d95a80863778c035aaed326b0e1b046b83394cf5f31b4d02996589683999ba4c"

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

  uninstall launchctl: "RClone Manager",
            quit:      [
              "com.rclone.manager",
              "io.github.zarestia_dev.rclone-manager",
            ]

  zap trash: [
    "~/Library/Application Support/com.rclone.manager",
    "~/Library/Application Support/CrashReporter/rclone-manager_*.plist",
    "~/Library/Application Support/io.github.zarestia_dev.rclone-manager",
    "~/Library/Caches/com.rclone.manager",
    "~/Library/Caches/io.github.zarestia_dev.rclone-manager",
    "~/Library/LaunchAgents/RClone Manager.plist",
    "~/Library/Logs/com.rclone.manager",
    "~/Library/Preferences/com.rclone.manager.plist",
    "~/Library/Preferences/io.github.zarestia_dev.rclone-manager.plist",
    "~/Library/Saved Application State/com.rclone.manager.savedState",
    "~/Library/Saved Application State/io.github.zarestia_dev.rclone-manager.savedState",
    "~/Library/WebKit/com.rclone.manager",
  ]
end

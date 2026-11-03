# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.2.5" do
  version "0.2.5"

  on_arm do
    sha256 "636ea78a61540f3650edc6a7d98690ce2868880c9ed5b772f3979c3486aa1ef2"

    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "836d7fb4a4210656f0c946a7bdb333ad91ed329014de35e09c8dcc4f7f27c11f"

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

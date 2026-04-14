# AUTO-GENERATED FILE. DO NOT EDIT!
cask "rclone-manager@0.2.4" do
  version "0.2.4"
  on_arm do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_aarch64.dmg"
    sha256 "678f2bf59bf2a39364d24d97dfd8be6ab4d8758bc6c1d5e894c3df1470d4c8ea"
  end
  on_intel do
    url "https://github.com/Zarestia-Dev/rclone-manager/releases/download/v#{version}/RClone.Manager_#{version}_x64.dmg"
    sha256 "558b36273b6e42e2eb844aa04258dac558173be46849f08ecde490f2b0a86157"
  end
  name "RClone Manager"
  desc "GUI for rclone built with Angular and Tauri"
  homepage "https://github.com/Zarestia-Dev/rclone-manager"
  depends_on macos: ">= :ventura" # macOS 13
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

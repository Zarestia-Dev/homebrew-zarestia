# RClone Manager Homebrew Tap

This repository contains the **Homebrew Cask** for installing **RClone Manager** on macOS.
RClone Manager is an open-source GUI manager for RClone.

---

## 📦 Installation

### Step 1 – Tap the repository

```bash
brew tap RClone-Manager/homebrew-rclone-manager
```

### Step 2 – Install the app

```bash
brew install --cask rclone-manager
```

Homebrew will automatically install the correct version for **Intel** or **Apple Silicon (M1/M2)** Macs.

---

## ⚠️ macOS Security Notice

RClone Manager is **open-source and unsigned**.
macOS may warn:

> "RClone Manager.app" can't be opened because it is from an unidentified developer.
> "RClone Manager.app" is damaged and can’t be opened.

This is **normal** — the app is not damaged.

### ✅ How to run it anyway

**Option 1 – Right-click → Open**

1. Go to `/Applications`.
2. Right-click **RClone Manager.app** → **Open**.
3. Confirm in the dialog.

**Option 2 – Terminal (recommended for advanced users)**

```bash
xattr -rd com.apple.quarantine "/Applications/RClone Manager.app"
```

After this, the app will run normally.

---

## 🔄 Updating

When a new version is released:

```bash
brew update
brew upgrade --cask rclone-manager
```

---

## 🛠 Troubleshooting

* If Homebrew says the cask is not found, make sure the tap is added:

  ```bash
  brew tap
  ```

  and check that `RClone-Manager/homebrew-rclone-manager` is listed.

* If Gatekeeper still blocks the app, re-run the `xattr` command above.

---

## 📌 Notes

* This tap is **community-driven** and intended for hobby/open-source use.
* App is **unsigned** and **not notarized** by Apple, so Gatekeeper warnings are expected.
* Contributions, bug reports, and suggestions are welcome via the main [RClone Manager repo](https://github.com/RClone-Manager/rclone-manager).

---

This README covers:

* How to install
* How to bypass Gatekeeper
* Updating the app
* Troubleshooting

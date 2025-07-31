# Cursor IDE for Ubuntu – Installer, Updater & Uninstaller

This repository provides **three bash scripts** to manage **Cursor IDE** on Ubuntu using the official **AppImage**:

- `install_cursor.sh` – Installs Cursor IDE  
- `update_cursor.sh` – Updates to the latest version  
- `uninstall_cursor.sh` – Removes Cursor IDE completely  

---

## 📦 Features

- Installs the **latest Cursor AppImage** to `/opt/cursor`
- Adds a **desktop launcher** and icon for easy access
- Creates a **global command `cursor`**
- Supports **manual updates** to the newest release
- Fully **removable** with the uninstall script

---

## 🔹 Installation

1. Clone this repository or copy the scripts:

   ```bash
   git clone https://github.com/yourusername/cursor-ubuntu.git
   cd cursor-ubuntu
   chmod +x install_cursor.sh update_cursor.sh uninstall_cursor.sh

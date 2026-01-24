# arch-setup

Minimal, reproducible Arch Linux setup using explicit package lists and a single install script.

This repository allows me to fully restore my Arch Linux environment after a fresh installation by installing only the packages I explicitly chose. Dependencies are resolved automatically by pacman and the AUR helper.

---

## 📦 Repository Structure

```
arch-setup/
├── install.sh
├── packages-pacman.txt
├── packages-aur.txt
└── README.md
```

* **packages-pacman.txt**
  Explicitly installed packages from the official Arch repositories.

* **packages-aur.txt**
  Explicitly installed packages from the AUR.

* **install.sh**
  Installs all packages and enables required system services.

---

## 🎯 Philosophy

* Track only **explicitly installed packages**
* Let pacman resolve **dependencies automatically**
* Keep the setup **idempotent** (`--needed`)
* Separate **system setup** from **user dotfiles**

This repository intentionally does **not** contain any configuration files.

---

## 🚀 Usage

### Fresh Arch installation

After installing a minimal Arch Linux system and setting up networking:

```bash
git clone https://github.com/<your-username>/arch-setup.git
cd arch-setup
chmod +x install.sh
./install.sh
```

A reboot is recommended after the script completes.

---

## 🔧 What the script does

* Updates the system
* Installs all pacman packages listed in `packages-pacman.txt`
* Installs `yay` if it is not already present
* Installs all AUR packages listed in `packages-aur.txt`
* Enables essential services:

  * NetworkManager
  * Bluetooth
  * Docker
  * reflector.timer

---

## 🧪 Validation

To verify that the package lists match the current system:

```bash
pacman -Qeqn | sort
pacman -Qmq  | sort
```

These outputs should match `packages-pacman.txt` and `packages-aur.txt`.

---

## 📁 Related repositories

* **dotfiles** – user configuration (`~/.config`, themes, Hyprland, Waybar, etc.)


#!/usr/bin/env bash
set -e

if [[ $EUID -eq 0 ]]; then
  echo "Vous ne devez pas lancer ce script en Root."
  exit 1
fi

echo "==> Mise à jour du système"
sudo pacman -Syu --noconfirm

echo "==> Installation des paquets pacman"
sudo pacman -S --needed --noconfirm - < packages-pacman.txt

if ! command -v yay &>/dev/null; then
  echo "==> Installation de yay"
  git clone https://aur.archlinux.org/yay-git.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
fi

echo "==> Installation des paquets AUR"
yay -S --needed --noconfirm - < packages-aur.txt

echo "==> Activation des services essentiels"
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable docker
sudo systemctl enable reflector.timer

echo "Installation terminée (reboot recommandé)"

#!/bin/bash

#Script de instalação do linux

sudo apt upgrade
# ou
sudo dnf upgrade

# Instalção dos principais apps

# VScode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update
sudo dnf install code # or code-insiders

# Google Chrome

flatpak install flathub com.google.Chrome -y

# Spotify

flatpak install flathub com.spotify.Client -y

# Impression

flatpak install flathub io.gitlab.adhami3310.Impression

# Telegram

flatpak install flathub org.telegram.desktop -y

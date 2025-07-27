#!/bin/bash


echo "-----------------------------"
echo "Script de instalação do linux"
echo "-----------------------------"


# Atualização do sistema operacional
sudo apt update && sudo apt upgrade -y
# ou
sudo dnf update && sudo dnf upgrade -y


# Instalção dos principais apps


# VScode via apt

    # 1 passo
    
      sudo apt install ./<file>.deb
      # If you're on an older Linux distribution, you will need to run this instead:
      # sudo dpkg -i <file>.deb
      # sudo apt-get install -f # Install dependencies

    # 2 passo

      echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections

    # 3 passo

      sudo apt-get install wget gpg
      wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
      sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
      echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
      rm -f packages.microsoft.gpg

    # 4 passo

      sudo apt install apt-transport-https
      sudo apt update
      sudo apt install code # or code-insiders

# VScode via dnf
    # sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    # echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    
    # dnf check-update
    # sudo dnf install code # or code-insiders

# Brave
flatpak install flathub com.brave.Browser -y

# Google Chrome
flatpak install flathub com.google.Chrome -y

# Spotify
flatpak install flathub com.spotify.Client -y

# Impression
flatpak install flathub io.gitlab.adhami3310.Impression -y

# Github Desktop
flatpak install flathub io.github.shiftey.Desktop -y

# LocalSend
flatpak install flathub org.localsend.localsend_app -y

# Duolingo
flatpak install flathub ro.go.hmlendea.DL-Desktop -y

# VLC
flatpak install flathub org.videolan.VLC -y

# Slack
flatpak install flathub com.slack.Slack -y

# HTTPie
flatpak install flathub io.httpie.Httpie -y

# Antares SQL
flatpak install flathub it.fabiodistasio.AntaresSQL -y

# Todoist
flatpak install flathub com.todoist.Todoist -y

# Android Studio
# flatpak install flathub com.google.AndroidStudio -y

# Telegram
# flatpak install flathub org.telegram.desktop -y

#!/bin/bash

# Cores
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Cabeçalho
echo -e "${CYAN}-------------------------------"
echo -e " Script de Instalação para Linux"
echo -e "-------------------------------${RESET}"

# Mostrar menu inicial
echo -e "${YELLOW}\n⚠️  Antes de configurar o Fish ou instalar aplicações, é recomendável atualizar o sistema operativo!${RESET}"
echo -e "${CYAN}\nO que deseja fazer?"
echo -e "[1] Atualizar o sistema operacional"
echo -e "[2] Configurar o Fish como shell padrão"
echo -e "[3] Instalar aplicações via Flatpak"
echo -e "[0] Sair${RESET}"
read -p "Escolha uma opção: " MAIN_OPTION

# Função para escolher o gestor de pacotes
escolher_gestor_pacotes() {
    echo -e "${CYAN}\nQual é o teu gestor de pacotes?"
    echo -e "[1] apt (Debian, Ubuntu, Pop!_OS)"
    echo -e "[2] dnf (Fedora, RHEL, CentOS)${RESET}"
    read -p "Escolha [1/2]: " PKG_OPTION

    if [ "$PKG_OPTION" == "1" ]; then
        PKG="apt"
        echo -e "${GREEN}Selecionado: apt${RESET}"
    elif [ "$PKG_OPTION" == "2" ]; then
        PKG="dnf"
        echo -e "${GREEN}Selecionado: dnf${RESET}"
    else
        echo -e "${RED}Opção inválida. Abortando...${RESET}"
        exit 1
    fi
}

# Atualização do sistema
atualizar_sistema() {
    escolher_gestor_pacotes
    echo -e "${CYAN}\n🔄 Atualizando o sistema...${RESET}"
    if [ "$PKG" == "apt" ]; then
        sudo apt update && sudo apt upgrade -y
    else
        sudo dnf update -y && sudo dnf upgrade -y
    fi
}

# Configurar o Fish como shell padrão
configurar_fish() {
    escolher_gestor_pacotes

    echo -e "${CYAN}\n🐟 Configurando o Fish como shell padrão...${RESET}"
    if [ "$PKG" == "apt" ]; then
        sudo apt install fish -y
    else
        sudo dnf install fish -y
    fi

    FISH_PATH=$(which fish)

    if ! grep -q "$FISH_PATH" /etc/shells; then
        echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi

    chsh -s "$FISH_PATH"
    echo -e "${GREEN}✅ Fish configurado com sucesso como shell padrão.${RESET}"
}

# Lista de apps via Flatpak
declare -A APPS
APPS=(
    ["Brave"]="com.brave.Browser"
    ["Google Chrome"]="com.google.Chrome"
    ["Spotify"]="com.spotify.Client"
    ["Impression"]="io.gitlab.adhami3310.Impression"
    ["Github Desktop"]="io.github.shiftey.Desktop"
    ["LocalSend"]="org.localsend.localsend_app"
    ["Duolingo"]="ro.go.hmlendea.DL-Desktop"
    ["VLC"]="org.videolan.VLC"
    ["Slack"]="com.slack.Slack"
    ["HTTPie"]="io.httpie.Httpie"
    ["Antares SQL"]="it.fabiodistasio.AntaresSQL"
    ["Todoist"]="com.todoist.Todoist"
    # ["VS Code"]="com.visualstudio.code"
    # ["Android Studio"]="com.google.AndroidStudio"
    # ["Telegram"]="org.telegram.desktop"
)

# Função para instalar apps Flatpak
instalar_aplicacoes() {
    echo -e "${YELLOW}\n📋 Lista de apps Flatpak disponíveis para instalação:"
    for app in "${!APPS[@]}"; do
        echo -e "  - $app"
    done

    echo -e "\n⚠️  Podes cancelar agora com Ctrl+C ou respondendo 'n'."
    read -p "Desejas continuar? [s/N]: " CONFIRM

    if [[ ! "$CONFIRM" =~ ^[Ss]$ ]]; then
        echo -e "${RED}Instalação cancelada pelo utilizador.${RESET}"
        exit 0
    fi

    echo -e "${CYAN}\n📦 Queres instalar todos os apps Flatpak listados?"
    echo -e "[1] Sim, instalar todos"
    echo -e "[2] Escolher manualmente${RESET}"
    read -p "Opção: " CHOICE

    flatpak_install() {
        echo -e "${GREEN}Instalando $1...${RESET}"
        flatpak install flathub "$2" -y
    }

    if [ "$CHOICE" == "1" ]; then
        for app in "${!APPS[@]}"; do
            flatpak_install "$app" "${APPS[$app]}"
        done
    elif [ "$CHOICE" == "2" ]; then
        for app in "${!APPS[@]}"; do
            echo -e "${CYAN}\nInstalar $app?"
            echo -e "[s] Sim"
            echo -e "[n] Não"
            echo -e "[c] Cancelar instalação completa${RESET}"
            read -p "Resposta: " RESP
            case "$RESP" in
                [Ss])
                    flatpak_install "$app" "${APPS[$app]}"
                    ;;
                [Nn])
                    echo -e "${RED}Ignorando $app...${RESET}"
                    ;;
                [Cc])
                    echo -e "${RED}Instalação cancelada pelo utilizador durante a seleção manual.${RESET}"
                    exit 0
                    ;;
                *)
                    echo -e "${YELLOW}Entrada inválida. Ignorando $app...${RESET}"
                    ;;
            esac
        done
    else
        echo -e "${RED}Opção inválida. Abortando...${RESET}"
        exit 1
    fi
}

# Executar conforme escolha do menu
case "$MAIN_OPTION" in
    1) atualizar_sistema ;;
    2) configurar_fish ;;
    3) instalar_aplicacoes ;;
    0) echo -e "${RED}Saindo...${RESET}" && exit 0 ;;
    *) echo -e "${RED}Opção inválida. Abortando...${RESET}" && exit 1 ;;
esac

echo -e "${GREEN}\n🎉 Operação concluída!${RESET}"

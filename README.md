# 🚀 Script de Instalação Linux

Um script interativo e personalizável para configurar rapidamente o teu sistema Linux! Ideal para pós-instalação no Pop!_OS, Ubuntu, Zorin OS, Fedora e outras distros baseadas em `apt` ou `dnf`.

---

## 📦 O que este script faz?

Com este script podes:

- 🔄 **Atualizar o sistema operativo** com base no teu gestor de pacotes
- 🐟 **Configurar o Fish como shell padrão**
- 🧰 **Instalar aplicações úteis via Flatpak**, todas de uma vez ou escolhendo manualmente

Tudo de forma guiada, com menus interativos e mensagens claras!

---

## ⚙️ Como usar

```bash
# Clona este repositório

git clone https://github.com/antonioamandio/linux-installation-script.git
cd installation_script

# Dá permissão de execução ao script
chmod +x installation_script.sh

# Executa o script
./installation_script.sh
```

---

## 🛠️ Personalização dos apps

A lista de apps Flatpak está definida dentro do ficheiro `installation_script.sh`. Para alterá-la, edita esta parte:

```bash
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
    # ["Telegram"]="org.telegram.desktop"
)
```
Substitui, remove ou adiciona os apps que preferires.
Consulta [https://flathub.org](https://flathub.org) para encontrar outros IDs de apps Flatpak.

---

## 🧪 Requisitos

- Um sistema baseado em `apt` (Debian, Ubuntu, Pop!_OS, Zorin OS) ou `dnf` (Fedora, RHEL, etc)
- Flatpak instalado e com o repositório Flathub configurado

---

## 💡 Dica

Antes de instalar aplicações ou configurar o shell, é recomendado atualizar o sistema operativo para evitar erros de repositório ou conflitos de pacotes.

---

## 📝 Licença

Este projeto é livre para uso e modificação.
Sinta-se à vontade para adaptar o script às tuas necessidades!

---

## ✨ Contribuições

Ideias, melhorias ou problemas?
Abre uma [issue](https://github.com/antonioamandio/linux-installation-script/issues) ou faz um [pull request](https://github.com/antonioamandio/linux-installation-script/pulls). Toda contribuição é bem-vinda!

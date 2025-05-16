#!/bin/bash

LOG_FILE="$HOME/install.log"
TOTAL_STEPS=8  # Número total de pasos en la instalación
CURRENT_STEP=0

# Instalar `pv` antes de todo
echo "[*] Instalando Pipe Viewer (pv) para mostrar progreso..." | tee -a "$LOG_FILE"
pkg install pv -y >> "$LOG_FILE" 2>&1 || { echo "[✖] Error al instalar pv. Revisa $LOG_FILE."; exit 1; }

# Función para mostrar barra de progreso
progress_bar() {
    local percent=$(( 100 * CURRENT_STEP / TOTAL_STEPS ))
    echo -ne "[*] Instalando... [$CURRENT_STEP/$TOTAL_STEPS] ($percent%)\r"
}

# Función para verificar si un paquete está instalado
check_package() {
    dpkg -s "$1" &> /dev/null
}

# Función para instalar un paquete con manejo de errores
install_package() {
    local package=$1
    CURRENT_STEP=$((CURRENT_STEP + 1))
    progress_bar

    if check_package "$package"; then
        echo "[✔] $package ya está instalado." | tee -a "$LOG_FILE"
    else
        echo "[*] Instalando $package..." | tee -a "$LOG_FILE"
        if pkg install "$package" -y | pv -lep -s $TOTAL_STEPS >> "$LOG_FILE" 2>&1; then
            echo "[✔] $package instalado correctamente." | tee -a "$LOG_FILE"
        else
            echo "[✖] Error al instalar $package. Revisa $LOG_FILE." | tee -a "$LOG_FILE"
            exit 1
        fi
    fi
}

# Actualizar paquetes
echo "[*] Actualizando Termux..." | tee -a "$LOG_FILE"
pkg update && pkg upgrade -y | pv -lep -s $TOTAL_STEPS >> "$LOG_FILE" 2>&1 || { echo "[✖] Error en actualización. Revisa $LOG_FILE."; exit 1; }

# Habilitar repositorios adicionales
install_package "x11-repo"

# Lista de paquetes a instalar
PACKAGES=("git" "neovim" "nodejs-lts" "npm" "python" "python3" "python3-pip" "perl" "curl" "wget" "lua-language-server" "ripgrep" "stylua" "tree-sitter-parsers" "clang" "make" "php" "lua51" "luarocks" "xclip" "termux-api" "cargo")

# Instalar paquetes con barra de progreso
for pkg in "${PACKAGES[@]}"; do
    install_package "$pkg"
done

# Actualizar npm globalmente
CURRENT_STEP=$((CURRENT_STEP + 1))
progress_bar
echo "[*] Actualizando npm globalmente..." | tee -a "$LOG_FILE"
npm update -g jsdoc | pv -lep -s $TOTAL_STEPS >> "$LOG_FILE" 2>&1 || { echo "[✖] Error al actualizar npm. Revisa $LOG_FILE."; exit 1; }

# Instalar `vscode-langservers-extracted`
CURRENT_STEP=$((CURRENT_STEP + 1))
progress_bar
echo "[*] Instalando vscode-langservers-extracted..." | tee -a "$LOG_FILE"
npm install -g vscode-langservers-extracted | pv -lep -s $TOTAL_STEPS >> "$LOG_FILE" 2>&1 || { echo "[✖] Error al instalar vscode-langservers-extracted. Revisa $LOG_FILE."; exit 1; }

# Eliminar configuraciones previas de Neov((CURRENT_STEP + 1))
progress_bar
echo "[*] Eliminando configuraciones previas de Neovim..." | tee -a "$LOG_FILE"
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim

# Instalar NvChad con barra de progreso
CURRENT_STEP=$((CURRENT_STEP + 1))
progress_bar
echo "[*] Instalando NvChad..." | tee -a "$LOG_FILE"
if git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1 | pv -lep -s $TOTAL_STEPS >> "$LOG_FILE" 2>&1; then
    echo "[✔] NvChad instalado correctamente." | tee -a "$LOG_FILE"
    nvim
else
    echo "[✖] Error al instalar NvChad. Revisa $LOG_FILE." | tee -a "$LOG_FILE"
    exit 1
fi

echo -e "\n[✔] Instalación completa. ¡Disfruta Neovim con NvChad! 🚀"

# termux-neovim-nvchad 

# clona el repositorio y dale permisos de ejecución al scripting 

cd Install-neovim-nvchad/ && chmod +x install-nvchad.sh

# ejecuta el script con 
./install-nvchad.sh

# luego de completada la instalación usa los siguientes comandos de neovim para actualizar todo 

:MasonInstallAll
:Lazy sync

# por último elimina el directorio oculto .git 

rm -rf /data/data/com.termux/files/home/.config/nvim/.git

# listo disfruta de tu editor en termux 

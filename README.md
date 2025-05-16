# termux-neovim-nvchad 

### **Actulizamos nuestro termux**

<pre><code>pkg update && pkg upgrade -y</code></pre>


### **clona el repositorio y dale permisos de ejecución al script**

<pre><code>cd Install-neovim-nvchad/ && chmod +x install-nvchad.sh</code></pre>

### ejecuta el script con 

<pre><code>./install-nvchad.sh</code></pre>

# luego de completada la instalación usa los siguientes comandos de neovim para actualizar todo 

:MasonInstallAll


:Lazy sync

# por último elimina el directorio oculto .git 

<pre><code>rm -rf /data/data/com.termux/files/home/.config/nvim/.git</code></pre>

# listo disfruta de tu editor en termux 

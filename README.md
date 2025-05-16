## termux-neovim-nvchad 

### **Actulizamos nuestro termux**

<pre><code>pkg update && pkg upgrade -y</code></pre>


### **clona el repositorio**

<pre><code>git clone https://github.com/indigo-steam/Termux-neovim-nvchad.git </code></pre>
### dale permisos de ejecución al script
<pre><code>cd Termux-neovim-nvchad/ && chmod +x termux-install-nvchad.sh</pre></code>
### ejecuta el script 

<pre><code>./termux-install-nvchad.sh</code></pre>

### luego de completada la instalación usa los siguientes comandos de neovim para actualizar todo 

<pre><code>:MasonInstallAll</pre></code>


<pre><code></code>Lazy sync</pre></code>

### por último elimina el directorio oculto .git 

<pre><code>rm -rf /data/data/com.termux/files/home/.config/nvim/.git</code></pre>

### listo disfruta de tu editor en termux 

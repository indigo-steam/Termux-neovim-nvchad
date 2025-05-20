## termux-neovim-nvchad 

### **Actulizamos nuestro termux e instalamos git**

<pre><code>pkg update && pkg upgrade -y && pkg install git -y</code></pre>


### **clona el repositorio**

<pre><code>git clone https://github.com/indigo-steam/Termux-neovim-nvchad.git </code></pre>
### dale permisos de ejecución al script
<pre><code>cd Termux-neovim-nvchad/ && chmod +x termux-install-nvchad.sh</pre></code>
### ejecuta el script 

<pre><code>./termux-install-nvchad.sh</code></pre>

### una vez instalado nuestro editor precionamos enter las veces que nos solicite, para que terminen las configuraciones faltantes,  ..

### luego de completada la instalación dentro de neovim pasa al modo comando y usa estos dos comandos para actualizar todo 

<pre><code>MasonInstallAll</pre></code>


<pre><code></code>Lazy sync</pre></code>

### por último elimina el directorio oculto .git 

<pre><code>rm -rf /data/data/com.termux/files/home/.config/nvim/.git</code></pre>

### listo disfruta de tu editor en termux 

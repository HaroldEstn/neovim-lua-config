# Guía de Instalación - Neovim Configuration

## 📋 Requisitos Previos

### Sistema Operativo
- Linux, macOS o Windows (con WSL2)
- Neovim >= 0.9

### Dependencias del Sistema
```bash
# Ubuntu/Debian
sudo apt-get install neovim git curl

# macOS
brew install neovim git

# Fedora
sudo dnf install neovim git
```

### Lenguajes y Herramientas
```bash
# Python (para pyright y otros)
sudo apt-get install python3 python3-pip

# Node.js (para algunos LSP servers)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs

# Git (para clonar repositorios)
sudo apt-get install git
```

## 🚀 Instalación Rápida

### 1. Clonar la Configuración
```bash
git clone https://github.com/HaroldEstn/neovim-lua-config.git ~/.config/nvim
cd ~/.config/nvim
```

### 2. Instalar Plugins
Abre Neovim:
```bash
nvim
```

Dentro de Neovim, ejecuta:
```vim
:Lazy sync
```

Espera a que se instalen todos los plugins (puede tomar unos minutos).

### 3. Instalar LSP Servers
Dentro de Neovim, ejecuta:
```vim
:Mason
```

Selecciona e instala los servidores que necesites:
- `pyright` - Para Python
- `lua_ls` - Para Lua
- Otros según tus necesidades

### 4. Instalar Formateadores (Opcional pero Recomendado)

#### Python
```bash
pip install black isort flake8 pylint
```

#### Lua
```bash
# Usando cargo (Rust)
cargo install stylua

# O usando npm
npm install -g stylua
```

#### JavaScript/TypeScript
```bash
npm install -g prettier
```

#### General
```bash
npm install -g prettier
```

## ✅ Verificación de Instalación

### Verificar Neovim
```bash
nvim --version
```

### Verificar Plugins
Dentro de Neovim:
```vim
:Lazy status
```

### Verificar LSP
Dentro de Neovim:
```vim
:Mason
```

### Verificar Configuración
Dentro de Neovim:
```vim
:checkhealth
```

## 🔧 Configuración Personalizada

### Agregar un Nuevo LSP Server

1. Abre `lua/lsp.lua`
2. Agrega la configuración del servidor:
```lua
vim.lsp.config('tu_servidor', {
  cmd = { 'tu-servidor-cmd' },
  filetypes = { 'tu_lenguaje' },
  root_markers = { 'archivo_raiz' },
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable('tu_servidor')
```

3. Guarda y reinicia Neovim

### Cambiar el Tema

1. Abre `lua/config.lua`
2. Modifica la configuración de onedark:
```lua
require('onedark').setup {
    transparent = false  -- Cambiar a false para fondo opaco
}
```

### Agregar un Nuevo Plugin

1. Abre `lua/plugins.lua`
2. Agrega el plugin:
```lua
{
  'usuario/plugin',
  config = function()
    require('plugin').setup()
  end
}
```

3. Ejecuta `:Lazy sync` en Neovim

## 🐛 Solución de Problemas

### Los plugins no se cargan
```vim
:Lazy sync
:Lazy update
:Lazy clean
```

### LSP no funciona
1. Verifica que el servidor esté instalado:
```vim
:Mason
```

2. Verifica los logs:
```vim
:LspInfo
```

### Error: "Mason no está instalado"
Ejecuta `:Lazy sync` nuevamente.

### Error: "Telescope no está instalado"
Ejecuta `:Lazy sync` nuevamente.

### Errores de formateo
Asegúrate de tener instalados los formateadores:
```bash
pip install black isort
npm install -g prettier
```

## 📚 Recursos Útiles

- [Neovim Documentation](https://neovim.io/doc/user/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [LSPConfig](https://github.com/neovim/nvim-lspconfig)

## 🆘 Soporte

Si encuentras problemas:

1. Verifica los logs de Neovim:
```vim
:messages
```

2. Revisa la salida de `:checkhealth`

3. Abre un issue en GitHub con:
   - Tu versión de Neovim
   - Tu sistema operativo
   - El error exacto
   - Los pasos para reproducirlo

## 📝 Notas Importantes

- La primera vez que abres Neovim puede tomar más tiempo (instalando plugins)
- Algunos LSP servers requieren dependencias adicionales del sistema
- Asegúrate de tener suficiente espacio en disco (~500MB para todos los plugins)

---

**Última actualización**: 2026-02-28

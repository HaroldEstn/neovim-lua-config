# Neovim Configuration

Una configuración moderna, segura y estable de Neovim con Lua, optimizada para desarrollo en Python, Lua y otros lenguajes.

## 🎯 Características

- **Gestor de Plugins**: Lazy.nvim para carga rápida y eficiente
- **LSP Integrado**: Mason + Mason-lspconfig para gestión automática de servidores LSP
- **Autocompletado**: nvim-cmp con soporte para LSP y snippets
- **Búsqueda Fuzzy**: Telescope para búsqueda de archivos y texto
- **Formateo**: Conform.nvim para formateo automático de código
- **Tema**: OneDark con soporte para transparencia
- **Barra de Estado**: Lualine personalizada con información de LSP
- **Comentarios**: Comment.nvim para comentar código fácilmente
- **Resaltado de Sintaxis**: Treesitter con parsers automáticos
- **Delimitadores Coloreados**: Rainbow-delimiters para mejor legibilidad

## 📦 Plugins Principales

### Interfaz

- `nvim-tree/nvim-tree.lua` - Explorador de archivos
- `akinsho/bufferline.nvim` - Barra de buffers
- `nvim-lualine/lualine.nvim` - Barra de estado
- `navarasu/onedark.nvim` - Tema OneDark

### LSP y Autocompletado

- `neovim/nvim-lspconfig` - Configuración de LSP
- `williamboman/mason.nvim` - Gestor de LSP servers
- `williamboman/mason-lspconfig.nvim` - Integración Mason + LSP
- `hrsh7th/nvim-cmp` - Motor de autocompletado
- `hrsh7th/cmp-nvim-lsp` - Fuente LSP para cmp
- `L3MON4D3/LuaSnip` - Motor de snippets

### Herramientas

- `nvim-telescope/telescope.nvim` - Búsqueda fuzzy
- `stevearc/conform.nvim` - Formateo de código
- `mfussenegger/nvim-lint` - Linting
- `nvim-treesitter/nvim-treesitter` - Resaltado de sintaxis
- `numToStr/Comment.nvim` - Comentarios
- `HiPhish/rainbow-delimiters.nvim` - Delimitadores coloreados

## 🚀 Instalación

### Requisitos

- Neovim >= 0.9
- Git
- Node.js (para algunos LSP servers)
- Python 3 (para pyright y otros)

### Pasos

1. **Clonar la configuración**

```bash
git clone https://github.com/HaroldEstn/neovim-lua-config.git ~/.config/nvim
```

2. **Instalar plugins**
   Abre Neovim y ejecuta:

```vim
:Lazy sync
```

3. **Instalar LSP servers**

```vim
:Mason
```

Selecciona e instala los servidores que necesites (pyright, lua_ls, etc.)

## ⌨️ Atajos de Teclado

### Navegación

- `<C-t>` - Toggle explorador de archivos (NvimTree)
- `<A-1>` a `<A-9>` - Cambiar entre buffers
- `<A-0>` - Ir al buffer 10

### Búsqueda (Telescope)

- `<leader>ff` - Buscar archivos
- `<leader>fg` - Buscar texto (live grep)
- `<leader>fb` - Buscar buffers
- `<leader>fh` - Buscar en help

### LSP

- `gd` - Ir a definición
- `gD` - Ir a declaración
- `gi` - Ir a implementación
- `gr` - Buscar referencias
- `K` - Mostrar hover
- `<C-k>` - Signature help
- `<leader>rn` - Renombrar
- `<leader>ca` - Code actions
- `<leader>f` - Formatear

### Comentarios

- `gcc` - Comentar línea
- `gbc` - Comentar bloque
- `gc` - Comentar en modo visual

### Formateo

- `<leader>fm` - Formatear archivo

## 🔧 Configuración

### Estructura de Archivos

```
~/.config/nvim/
├── init.lua              # Punto de entrada
├── lua/
│   ├── pluginmanager.lua # Configuración de Lazy.nvim
│   ├── plugins.lua       # Lista de plugins
│   ├── config.lua        # Configuración general
│   ├── maps.lua          # Atajos de teclado
│   ├── statusline.lua    # Configuración de lualine
│   ├── lsp.lua           # Configuración de LSP
│   ├── telescope_config.lua # Configuración de Telescope
│   └── conform_config.lua   # Configuración de Conform
├── .gitignore            # Archivos ignorados por git
└── README.md             # Este archivo
```

### Personalización

#### Agregar un nuevo LSP server

En `lua/lsp.lua`, agrega el servidor a la lista `ensure_installed`:

```lua
mason_lspconfig.setup({
  ensure_installed = { "pyright", "lua_ls", "tu_servidor" },
  automatic_installation = true,
})
```

#### Cambiar el tema

En `lua/config.lua`:

```lua
require('onedark').setup {
    transparent = true  -- Cambiar a false para fondo opaco
}
```

#### Agregar un nuevo plugin

En `lua/plugins.lua`:

```lua
{
  'usuario/plugin',
  config = function()
    require('plugin').setup()
  end
}
```

## 🔒 Seguridad

- ✅ Todos los plugins están verificados y son de fuentes confiables
- ✅ Manejo de errores con `pcall()` para evitar crashes
- ✅ APIs modernas de Neovim (sin deprecadas)
- ✅ Configuración privada (no se sincroniza información sensible)
- ✅ .gitignore completo para archivos temporales

## 📝 Notas Importantes

### Plugins Removidos

- `terrortylor/nvim-comment` ❌ (Deprecado) → Reemplazado por `numToStr/Comment.nvim`

### APIs Actualizadas

- `vim.api.nvim_buf_get_option()` → `vim.bo.filetype`
- `vim.lsp.get_active_clients()` → `vim.lsp.get_clients()`

### Mejoras Implementadas

- ✅ Configuración LSP centralizada con Mason
- ✅ Manejo robusto de errores
- ✅ Estructura modular y limpia
- ✅ Telescope para búsqueda eficiente
- ✅ Conform para formateo automático
- ✅ Treesitter optimizado

## 🐛 Solución de Problemas

### Los plugins no se cargan

```vim
:Lazy sync
:Lazy update
```

### LSP no funciona

```vim
:Mason
```

Instala los servidores necesarios.

### Errores de formateo

Asegúrate de tener instalados los formateadores:

```bash
pip install black isort
npm install -g prettier
```

## 📚 Recursos

- [Neovim Docs](https://neovim.io/doc/user/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## 📄 Licencia

Esta configuración está bajo la licencia MIT. Puedes usarla, modificarla y distribuirla libremente.

Si te sirvió, un ⭐ en GitHub se agradece.

Ver [LICENSE](LICENSE) para más detalles.

## 👤 Autor

HaroldEstn - [GitHub](https://github.com/HaroldEstn)

---

**Última actualización**: 2026-02-28
**Versión de Neovim**: >= 0.9

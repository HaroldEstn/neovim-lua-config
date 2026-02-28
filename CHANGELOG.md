# Changelog - Neovim Configuration

## [2.0.0] - 2026-02-28

### 🎉 Cambios Principales

#### ✨ Nuevas Características
- **Mason.nvim**: Gestor centralizado de LSP servers con instalación automática
- **Mason-lspconfig**: Integración automática entre Mason y lspconfig
- **Telescope.nvim**: Búsqueda fuzzy de archivos, texto y buffers
- **Conform.nvim**: Formateo automático de código con soporte para múltiples lenguajes
- **Comment.nvim**: Reemplazo moderno para comentarios (gcc, gbc, etc.)

#### 🔧 Correcciones y Mejoras
- ✅ Removido plugin deprecado `terrortylor/nvim-comment`
- ✅ Actualizado `vim.api.nvim_buf_get_option()` → `vim.bo.filetype`
- ✅ Actualizado `vim.lsp.get_active_clients()` → `vim.lsp.get_clients()`
- ✅ Corregida configuración duplicada en Treesitter
- ✅ Agregado manejo robusto de errores con `pcall()` en todas las configuraciones
- ✅ Mejorado .gitignore con exclusiones completas
- ✅ Estructura modular: separación de configuraciones en archivos independientes

#### 📁 Nuevos Archivos
- `lua/lsp.lua` - Configuración centralizada de LSP con Mason
- `lua/telescope_config.lua` - Configuración de búsqueda fuzzy
- `lua/conform_config.lua` - Configuración de formateo automático
- `.gitignore` - Mejorado con exclusiones de archivos temporales
- `CHANGELOG.md` - Este archivo

#### 🔒 Seguridad
- ✅ Todos los plugins verificados y de fuentes confiables
- ✅ Manejo de errores para evitar crashes
- ✅ APIs modernas sin deprecadas
- ✅ Configuración privada y segura

### 📝 Notas de Actualización

#### Para Usuarios Existentes
1. Ejecuta `:Lazy sync` para instalar nuevos plugins
2. Ejecuta `:Mason` para instalar LSP servers
3. Instala formateadores: `pip install black isort` y `npm install -g prettier`

#### Cambios en Atajos
- Nuevos atajos de Telescope:
  - `<leader>ff` - Buscar archivos
  - `<leader>fg` - Buscar texto
  - `<leader>fb` - Buscar buffers
  - `<leader>fh` - Buscar en help
- Nuevo atajo de formateo:
  - `<leader>fm` - Formatear archivo

### 🐛 Problemas Conocidos
- Algunos LSP servers requieren instalación manual de dependencias del sistema
- Conform requiere que los formateadores estén instalados en el sistema

### 🚀 Próximas Mejoras Planeadas
- [ ] Integración con DAP (Debug Adapter Protocol)
- [ ] Configuración de snippets mejorada
- [ ] Soporte para más lenguajes
- [ ] Temas adicionales

---

## [1.0.0] - 2024-10-04

### Versión Inicial
- Configuración básica de Neovim con Lua
- Plugins esenciales (nvim-tree, lualine, bufferline, etc.)
- Tema OneDark
- Autocompletado con nvim-cmp
- Treesitter para resaltado de sintaxis

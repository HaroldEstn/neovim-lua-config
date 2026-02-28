-- LSP Configuration with Mason (Neovim 0.11+ compatible)
local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  vim.notify("Mason no está instalado", vim.log.levels.WARN)
  return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok_mason_lspconfig then
  vim.notify("mason-lspconfig no está instalado", vim.log.levels.WARN)
  return
end

-- Setup Mason
pcall(function()
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
end)

-- Setup Mason-lspconfig
pcall(function()
  mason_lspconfig.setup({
    ensure_installed = { "pyright", "lua_ls" },
    automatic_installation = true,
  })
end)

-- LSP Capabilities
local capabilities = pcall(function()
  return require('cmp_nvim_lsp').default_capabilities()
end) and require('cmp_nvim_lsp').default_capabilities() or {}

-- On Attach function
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- Setup LSP servers using vim.lsp.config (Neovim 0.11+)
pcall(function()
  -- Pyright configuration
  vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', '.git' },
    on_attach = on_attach,
    capabilities = capabilities,
  })
  
  -- Lua LS configuration
  vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', 'selene.toml', 'stylua.toml' },
    on_attach = on_attach,
    capabilities = capabilities,
  })
  
  -- Enable the servers
  vim.lsp.enable('pyright')
  vim.lsp.enable('lua_ls')
end)

-- Diagnostics configuration
pcall(function()
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
  })
end)

-- Diagnostic signs
pcall(function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end)

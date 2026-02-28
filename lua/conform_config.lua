-- Conform.nvim Configuration (Code Formatter)
local status_ok, conform = pcall(require, 'conform')
if not status_ok then
  vim.notify("Conform no está instalado", vim.log.levels.WARN)
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>fm', function()
  conform.format({ async = true, lsp_fallback = true })
end, opts)

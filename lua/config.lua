-- onerdark theme
pcall(function()
  require('onedark').setup {
      transparent = true
  }
  require("onedark").load()
end)

-- nvim tree
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.del('n', '<C-t>', { buffer = bufnr })
  vim.keymap.set('n', '<C-t>', api.tree.toggle)
  vim.keymap.set('n', '<C-l>', api.tree.change_root_to_node)
end

require("nvim-tree").setup({
  on_attach = my_on_attach
})

-- status line
require('statusline')

-- buffer line
require("bufferline").setup{}

-- LSP Configuration (cargado después de que los plugins estén listos)
pcall(function()
  require('lsp')
end)

-- Telescope Configuration
pcall(function()
  require('telescope_config')
end)

-- Conform Configuration
pcall(function()
  require('conform_config')
end)

-- Git Configuration (gitsigns, lazygit, diffview)
pcall(function()
  require('git_config')
end)

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    if vim.bo.filetype == "python" then
      require("lint").try_lint("pylint")
      require("lint").try_lint("flake8")
    end
  end,
})
-- Nvim treesitter
pcall(function()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "json", "bash", "javascript", "typescript", "yaml" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = { "latex", "tex" },

    highlight = {
      enable = true,

      -- list of language that will be disabled
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      additional_vim_regex_highlighting = false,
    },
  }
end)

-- Rainbow delimiters
-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}


-- Comments
pcall(function()
  require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = nil,
    post_hook = nil,
  })
end)

return {
  {"navarasu/onedark.nvim"},  -- neovim theme
  {"nvim-tree/nvim-tree.lua"},  -- tree folder
  {"nvim-tree/nvim-web-devicons"},  -- icons nvim tree
  {
    "windwp/nvim-autopairs",  -- complete pairs {} ""
    event = "InsertEnter",
    config = true
  },
  {
    'nvim-lualine/lualine.nvim',  -- statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {'HiPhish/rainbow-delimiters.nvim'},

  {'neovim/nvim-lspconfig'},  -- Collection of configurations for built-in LSP client
  {'hrsh7th/nvim-cmp'},  -- Autocompletion plugin
  {'hrsh7th/cmp-nvim-lsp'},  -- LSP source for nvim-cmp
  {'saadparwaiz1/cmp_luasnip'},  -- Snippets source for nvim-cmp
  {'L3MON4D3/LuaSnip'},
  {'mfussenegger/nvim-lint'},
  {'nvim-treesitter/nvim-treesitter'},
  {'numToStr/Comment.nvim'}, -- Comments
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate'
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim' }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
  },

  -- Git plugins
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = true
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterToggle",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    dependencies = 'nvim-lua/plenary.nvim',
  }
}

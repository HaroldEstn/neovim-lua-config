-- Git plugins configuration
-- Configuración para gitsigns, lazygit y diffview

-- ============================================================================
-- GITSIGNS CONFIGURATION
-- ============================================================================
-- Muestra cambios en el gutter, git blame, y permite interactuar con hunks

require('gitsigns').setup {
  signs = {
    add          = { text = '┃', hl = 'GitSignsAdd' },
    change       = { text = '┃', hl = 'GitSignsChange' },
    delete       = { text = '_', hl = 'GitSignsDelete' },
    topdelete    = { text = '‾', hl = 'GitSignsDelete' },
    changedelete = { text = '~', hl = 'GitSignsChange' },
    untracked    = { text = '┆', hl = 'GitSignsUntracked' },
  },
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = ' <author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- ============================================================================
-- DIFFVIEW CONFIGURATION
-- ============================================================================
-- Visualización avanzada de diffs y manejo de merge conflicts

require('diffview').setup({
  diff_binaries = false,
  enhanced_diff_hl = false,
  git_cmd = { "git" },
  use_icons = true,
  show_help_hints = true,
  watch_index = true,
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
  view = {
    default = {
      layout = "diff2_horizontal",
      disable_diagnostics = false,
      winbar_info = false,
    },
    merge_tool = {
      layout = "diff3_horizontal",
      disable_diagnostics = false,
      winbar_info = false,
    },
    file_history = {
      layout = "diff2_horizontal",
      disable_diagnostics = false,
      winbar_info = false,
    },
  },
  file_panel = {
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
    win_config = {
      position = "left",
      width = 35,
      win_opts = {}
    },
  },
  file_history_panel = {
    log_options = {
      git = {
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
        },
      },
    },
    win_config = {
      position = "bottom",
      height = 16,
      win_opts = {}
    },
  },
  commit_log_panel = {
    win_config = {
      win_opts = {},
    }
  },
  default_args = {
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},
})

-- ============================================================================
-- KEYMAPS CONFIGURATION
-- ============================================================================
-- Atajos de teclado para todas las funcionalidades de Git

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Gitsigns keymaps
map('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', opts)
map('n', '<leader>gB', '<cmd>Gitsigns blame<CR>', opts)
map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', opts)
map('n', '<leader>gD', '<cmd>Gitsigns toggle_deleted<CR>', opts)
map('n', '<leader>gh', '<cmd>Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)

-- Navegación entre hunks
map('n', ']h', '<cmd>Gitsigns next_hunk<CR>', opts)
map('n', '[h', '<cmd>Gitsigns prev_hunk<CR>', opts)

-- Gitsigns en modo visual
map('v', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('v', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', opts)

-- LazyGit keymaps
map('n', '<leader>gg', '<cmd>LazyGit<CR>', opts)
map('n', '<leader>gf', '<cmd>LazyGitCurrentFile<CR>', opts)

-- Diffview keymaps
map('n', '<leader>gv', '<cmd>DiffviewOpen<CR>', opts)
map('n', '<leader>gV', '<cmd>DiffviewClose<CR>', opts)
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>', opts)

-- ============================================================================
-- INFORMACIÓN DE ATAJOS
-- ============================================================================
-- Gitsigns:
--   <leader>gb  - Git blame de la línea actual
--   <leader>gB  - Git blame del buffer completo
--   <leader>gd  - Diff del archivo actual
--   <leader>gD  - Toggle deleted lines
--   <leader>gh  - Preview del hunk actual
--   <leader>gr  - Reset hunk
--   <leader>gR  - Reset buffer completo
--   <leader>gs  - Stage hunk
--   <leader>gu  - Undo stage hunk
--   ]h / [h     - Navegar entre hunks
--
-- LazyGit:
--   <leader>gg  - Abrir LazyGit
--   <leader>gf  - LazyGit del archivo actual
--
-- Diffview:
--   <leader>gv  - Abrir Diffview
--   <leader>gV  - Cerrar Diffview
--   <leader>gH  - Ver historial de cambios del archivo

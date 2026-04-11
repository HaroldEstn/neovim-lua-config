-- DevOps & IaC Plugins Configuration
-- This file contains configuration for plugins specific to DevOps workflows

-- YAML Companion Configuration (for GitHub Actions, GitLab CI, CloudFormation, etc.)
pcall(function()
  local yaml_companion = require("yaml-companion")
  yaml_companion.setup({
    -- Schemas will be loaded from local cache
    builtin_matchers = {
      kubernetes = { enabled = true },
      docker_compose = { enabled = true },
      github_actions = { enabled = true },
      gitlab_ci = { enabled = true },
      cloudformation = { enabled = true },
    },
    schemas = {
      {
        name = "GitHub Actions",
        uri = "https://json.schemastore.org/github-workflow.json",
        path = "/.github/workflows/*.{yml,yaml}",
      },
      {
        name = "GitLab CI",
        uri = "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json",
        path = "/.gitlab-ci.yml",
      },
      {
        name = "CloudFormation",
        uri = "https://raw.githubusercontent.com/aws-cloudformation/cfn-python-lint/master/src/cfnlint/data/schemas/other/cfn-lint-metaschema.json",
        path = "/*.{template,cf}.{json,yaml,yml}",
      },
      {
        name = "Kubernetes",
        uri = "https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json",
        path = "/*.k8s.{yml,yaml}",
      },
    },
  })
end)

-- Terraform Documentation Configuration
pcall(function()
  require("telescope").load_extension("terraform_doc")
end)

-- ToggleTerm Configuration (Terminal for AWS CLI, Terraform, etc.)
pcall(function()
  local toggleterm = require("toggleterm")
  toggleterm.setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    persist_mode = false, -- Security: don't persist shell history
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

  -- Keymaps for ToggleTerm
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', opts)
  vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', opts)
  vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', opts)
  vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', opts)

  -- Terminal mode keymaps
  vim.keymap.set('t', '<C-\\>', '<cmd>ToggleTerm<cr>', opts)
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
end)

-- Trouble Configuration (Diagnostics UI) - v3 API
pcall(function()
  local trouble = require("trouble")
  trouble.setup({
    modes = {
      diagnostics = {
        auto_open = false,
        auto_close = false,
      },
    },
  })

  -- Keymaps for Trouble (v3 syntax)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', opts)
  vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', opts)
  vim.keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle<cr>', opts)
  vim.keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', opts)
  vim.keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', opts)
  vim.keymap.set('n', 'gR', '<cmd>Trouble lsp_references toggle<cr>', opts)
end)

-- Which-Key Configuration (Keybinding discovery) - v3 API
pcall(function()
  local which_key = require("which-key")
  which_key.setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    win = {
      border = "rounded",
    },
  })

  -- Register keybindings for DevOps (v3 syntax)
  which_key.add({
    { "<leader>t", group = "Terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
    { "<leader>x", group = "Trouble" },
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
    { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
  })
end)

-- Spectre Configuration (Search & Replace)
pcall(function()
  local spectre = require("spectre")
  spectre.setup({
    color_devicons = true,
    open_cmd = "noswapfile vimgrep",
    is_open_target_NvimTree = false,
    live_update = false,
    line_sep_start = "┌-----------------------------------------",
    result_padding = "¦  ",
    line_sep = "└-----------------------------------------",
    highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete",
    },
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle current item",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').enter_file()<CR>",
        desc = "goto current file",
      },
      ["send_to_qf"] = {
        map = "<leader>sq",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
      ["replace_cmd"] = {
        map = "<leader>sc",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace vim command",
      },
      ["show_option_menu"] = {
        map = "<leader>so",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show options",
      },
      ["run_current_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line",
      },
      ["run_replace"] = {
        map = "<leader>R",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
      ["change_view_mode"] = {
        map = "<leader>sv",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "results view mode",
      },
      ["toggle_live_update"] = {
        map = "<leader>su",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "update results on change",
      },
      ["toggle_ignore_case"] = {
        map = "<leader>si",
        cmd = "<cmd>lua require('spectre').toggle_ignore_case()<CR>",
        desc = "toggle ignore case",
      },
      ["toggle_ignore_hidden"] = {
        map = "<leader>sh",
        cmd = "<cmd>lua require('spectre').toggle_ignore_hidden()<CR>",
        desc = "toggle search hidden files",
      },
      ["resume_last_search"] = {
        map = "<leader>sl",
        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
        desc = "resume last search",
      },
    },
    default = {
      find = {
        cmd = "rg",
        options = { "ignore-case" },
      },
      replace = {
        cmd = "sed",
      },
    },
    replace_engine = {
      sed = {
        cmd = "sed",
        args = nil,
      },
      oxi = {
        cmd = "oxi",
        args = {},
      },
    },
    live_update = false,
    lsp_rename = true,
    is_block_ui_break = false,
  })

  -- Keymaps for Spectre
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>S', '<cmd>Spectre<cr>', opts)
  vim.keymap.set('n', '<leader>sw', '<cmd>Spectre<cr>', opts)
  vim.keymap.set('v', '<leader>sw', '<esc><cmd>Spectre<cr>', opts)
end)

-- Security Configuration
-- Disable telemetry and unnecessary providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Prevent accidental credential leaks
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pem", "*.key", "*.secret", ".env*", "*credentials*" },
  callback = function()
    vim.notify("⚠️  Sensitive file detected! Be careful with this file.", vim.log.levels.WARN)
    vim.bo.swapfile = false
    vim.bo.backup = false
    vim.bo.undofile = false
  end,
})

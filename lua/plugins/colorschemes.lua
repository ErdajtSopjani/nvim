-- colorschemes

return {
  {
    'bluz71/vim-nightfly-colors',
    config = function()
      -- Lua initialization file
      vim.g.nightflyCursorColor = true
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = true,
  },

  {
    'EdenEast/nightfox.nvim',
    config = function()
      -- vim.cmd [[colorscheme nightfox]]
    end,
  },

  {
    'rebelot/kanagawa.nvim',
  },

  {
    'rose-pine/neovim',
    config = function()
      -- vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
    end,
    name = 'rose-pine',
  },

  {
    'Mofiqul/dracula.nvim',
    config = function() end,
  },

  {
    'folke/tokyonight.nvim',
    init = function()
      vim.cmd 'set termguicolors'
      vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightblue]]
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none' -- this is a hack to fix the comment color in the night version
    end,
  },

  {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_terminal_colors = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_cursor = 'aqua'
      -- can set warning/error text to colored: vim.g.everforest_diagnostic_virtual_text = 'colored'
    end,
  },

  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_terminal_colors = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_cursor = 'aqua'
      vim.g.gruvbox_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
      -- vim.cmd 'set termguicolors'
      -- vim.cmd [[colorscheme gruvbox-material]]
    end,
  },

  {
    'catppuccin/nvim',
    config = function()
      -- vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
    end,
    name = 'catppucin',
  },
}

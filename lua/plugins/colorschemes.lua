-- colorschemes

return {
  {
    'bluz71/vim-nightfly-colors',
    config = function()
      -- Lua initialization file
      vim.g.nightflyCursorColor = true
    end,
  },
  { 'EdenEast/nightfox.nvim' },
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'cpea2506/one_monokai.nvim',
  },
  {
    'rose-pine/neovim',
    config = function()
      -- vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
    end,
    name = 'rose-pine',
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'tokyonight-storm'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'sainnhe/everforest',
    config = function()
      vim.g.everforest_terminal_colors = 1
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_cursor = 'aqua'
      vim.cmd [[colorscheme everforest]]
    end,
  },

  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_terminal_colors = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_better_performance = 1
    end,
  },

  {
    'sainnhe/sonokai',
    config = function()
      -- Available styles: default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_style = 'andromeda'
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_disable_italic_comment = 0
      vim.g.sonokai_terminal_colors = 1
      -- for transparent background: vim.g.sonokai_transparent_background = 1
      vim.g.sonokai_cursor = 'red'
      vim.g.sonkai_better_performance = 1
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

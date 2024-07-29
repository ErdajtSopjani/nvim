-- install lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Lazy load plugins
require('lazy').setup({
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- terminal toggle
    'akinsho/toggleterm.nvim',
    config = function()
      require('plugins.configs.toggleterm').setup()
    end,
  },

  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        extra_groups = {
          'NvimTreeNormal',
          'NvimTreeNormalNC',
          -- Add other groups
        },
      }
      vim.api.nvim_set_keymap('n', '<leader>tt', ':TransparentToggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require('plugins.configs.alpha').setup()
    end,
  },

  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  { -- laravel plugin
    'adalessa/laravel.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-dotenv',
      'MunifTanjim/nui.nvim',
      'nvimtools/none-ls.nvim',
    },
    cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' },
    config = true,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  --{
  --   'lukas-reineke/indent-blankline.nvim',
  --  main = 'ibl',
  --  opts = {
  --    scope = { enabled = false }, -- Disabling the current scope highlighting
  --  },
  --},

  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<D-j>', 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
      vim.keymap.del('i', '<Tab>')
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.keymap.set('i', '<D-w>', '<Plug>(copilot-accept-word)')
      vim.keymap.set('i', '<D-n>', '<Plug>(copilot-next)')
    end,
  },

  {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true }),
        vim.keymap.set('n', '<leader>bb', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true }),
      }
    end,
  },

  {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
    config = function()
      require('nvim-tree').setup {}
      -- Keymap for <leader>e to toggle the nvim-tree
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      -- Document existing key chains
      require('which-key').setup {
        ['<leader>c'] = { name = '[C]ode' },
        ['<leader>d'] = { name = '[D]ocument' },
        ['<leader>r'] = { name = '[R]ename' },
        ['<leader>s'] = { name = '[S]earch' },
        ['<leader>w'] = { name = '[W]orkspace' },
      }
    end,
  },

  require 'plugins.utils',
  require 'plugins.colorschemes',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

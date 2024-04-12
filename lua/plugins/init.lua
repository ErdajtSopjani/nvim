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
    'goolord/alpha-nvim',
    config = function()
      require('plugins.configs.alpha').setup()
    end,
  },

  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  {
    'rose-pine/neovim',
    config = function()
      vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
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
      vim.g.everforest_background = 'medium'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_cursor = 'aqua'
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
      vim.cmd [[autocmd VimEnter * highlight Cursor guibg=lightpink]]
    end,
    name = 'catppucin',
  },

  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = { enabled = false }, -- Disabling the current scope highlighting
    },
  },

  {
    'github/copilot.vim',
  },

  {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
      vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>bb', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
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

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  {
    'nvim-telescope/telescope.nvim', -- Fuzzy Finder (files, lsp, etc)
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('plugins.configs.telescope').setup()
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      require('plugins.configs.lspconfig').setup()
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true, cs = true } -- Disable "format_on_save lsp_fallback"
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      require('plugins.configs.cmp').setup()
    end,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
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

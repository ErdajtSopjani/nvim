local M = {}

function M.setup()
  require('toggleterm').setup {
    -- Configuration options
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
  }
  -- Terminal 1: Bottom horizontal part of the screen
  vim.api.nvim_set_keymap('n', '<A-a>', '<Cmd>1ToggleTerm size=8 direction=horizontal<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<A-a>', '<Cmd>1ToggleTerm size=8 direction=horizontal<CR>', { noremap = true, silent = true })

  -- Terminal 2: Right vertical part of the screen
  vim.api.nvim_set_keymap('n', '<A-s>', '<Cmd>2ToggleTerm size=40 direction=vertical<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<A-s>', '<Cmd>2ToggleTerm size=40 direction=vertical<CR>', { noremap = true, silent = true })

  -- Terminal 3: Floating terminal in the middle of the screen
  vim.api.nvim_set_keymap('n', '<A-e>', '<Cmd>3ToggleTerm size=80 direction=float<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<A-e>', '<Cmd>3ToggleTerm size=80 direction=float<CR>', { noremap = true, silent = true })
end

return M

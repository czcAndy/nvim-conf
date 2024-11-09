return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },

  init = function() 
    vim.g.barbar_auto_setup = false 
    vim.keymap.set('n', '<C-b>', ':BufferPrevious<CR>')
    vim.keymap.set('n', '<C-n>', ':BufferNext<CR>')
    vim.keymap.set('n', '<C-q>', ':BufferClose<CR>')
  end,
  opts = {
    noremap = true,
    silent = true
  }
} 

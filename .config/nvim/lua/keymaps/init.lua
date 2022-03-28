local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "
keymap ( 'n' , '<c-s>' , ':w<CR>' , {}  )
keymap ( 'n', 'Q', '<c-v>' , {})
keymap ( 'n', 'qq', ':q<CR>' , {})
keymap ( 'n', '<c-l>', ':NvimTreeToggle<CR>' , {})
-- keymap ( 'n' , '<c-t>' , ':NvimTreeToggle<CR>',{})
keymap ( 'n', '<c-h>', ':tabnew | Telescope help_tags<CR>' , {})
keymap ( 'n', '<c-f>', ':Telescope find_files<CR>' , {})
keymap ( 'n', '<c-Y>', ':PackerSync <CR>' , {})
keymap ( 'n', '<c-b>', ':PackerInstall<CR>' , {})
keymap ( 'n', '<leader>n', ':so %<CR>' , {})

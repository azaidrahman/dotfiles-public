local opt = vim.opt

-- [[ Setting options ]]
-- See `:help vim.opt`
opt.number = true -- Make line numbers default
opt.relativenumber = true
opt.mouse = 'a'
opt.showmode = false -- Don't show the mode, since it's already in the status line
--  See `:help 'clipboard'`
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true -- Configure how new splits should be opened
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split' -- Preview substitutions live, as you type!
opt.cursorline = true
opt.scrolloff = 20
opt.linebreak = true
opt.autoindent = true -- Copy indent from current line when starting a new line.
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
opt.tabstop = 4
opt.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
opt.autowrite = true -- Enable auto write
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.showtabline = 2 -- always show tabline
vim.g.transparent_enabled = true

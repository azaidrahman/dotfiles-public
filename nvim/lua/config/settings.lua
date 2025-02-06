local opt = vim.opt
local ufn = require 'utils.fn'

-------------
-- General --
-------------
opt.laststatus = 3
opt.title = true
opt.mouse = 'a'
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.virtualedit = 'block'
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
opt.wildignore = '.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
opt.undofile = true
opt.smartcase = true
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term

-------------
-- Line Numbers -
-------------
opt.relativenumber = true
opt.number = true -- Make line numbers default
opt.numberwidth = 4
opt.ruler = true -- Show the line and column number of the cursor position, separated by a comma.

-------------
-- Indentation --
-------------

opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
opt.autoindent = true -- Copy indent from current line when starting a new line.
opt.tabstop = 4
opt.softtabstop = 4
opt.showtabline = 2 -- always show tabline
opt.smarttab = true
-- opt.shiftaround = true

---------------
-- Timing --
---------------

opt.timeoutlen = 300
opt.updatetime = 250

---------------
-- Behaviors --
---------------

opt.breakat = [[\ \	;:,!?/.+-]] -- characters that might cause a linebreak if linebreak is on
opt.splitright = true -- Configure how new splits should be opened
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split' -- Preview substitutions live, as you type!
opt.cursorline = true
opt.scrolloff = 20
opt.linebreak = true
-- opt.autowrite = true -- Enable auto write
opt.confirm = true -- Confirm to save changes before exiting modified buffer

----------------
-- Appearance --
----------------

vim.g.transparent_enabled = true
opt.signcolumn = 'yes'
opt.conceallevel = 0
opt.fillchars:append { eob = ' ' }
opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor'
opt.termguicolors = true

-----------
-- Shell --
-----------
-- ref: https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#windows
local powershell_options = {
  shell = ufn.executable 'pwsh' and 'pwsh' or 'powershell',
  shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
  shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
  shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
  shellquote = '',
  shellxquote = '',
}

for option, value in pairs(powershell_options) do
  opt[option] = value
end

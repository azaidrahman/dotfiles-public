if vim.g.vscode then
  require 'core.vscode'
else
  vim.opt.termguicolors = true
  require 'core.globals'
  require 'core.lua_globals'
  require 'core.lazy'
  require 'config.autocmd'
  require 'config.settings'
  require 'config.keymaps'
  vim.cmd 'set autoread | au CursorHold * checktime'
end

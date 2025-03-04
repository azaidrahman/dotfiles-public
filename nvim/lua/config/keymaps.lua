-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  if rhs == nil then
    print("Warning: Attempted to map " .. lhs .. " to nil in mode " .. mode)
    return
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit current file" })
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })

vim.keymap.set("n", "<c-x>", function()
  vim.cmd.bd()
end)

-- open aerial
vim.keymap.set("n", "<leader>.", function()
  vim.cmd("Outline")
end)

-- open new terminal tab with tt
vim.keymap.set("n", "tt", ":term<cr>")

-- NeoAI bindings
vim.keymap.set("n", "<leader>nn", ":NeoAIToggle<cr>")
vim.keymap.set("v", "<leader>nc", ":NeoAIContext<cr>")
vim.keymap.set("n", "<leader>ni", ":NeoAI<CR>")

-- setup restnvim keybindings
vim.keymap.set("n", "<leader>xr", "<Plug>RestNvim")
vim.keymap.set("n", "<leader>xp", "<Plug>RestNvimPreview")
vim.keymap.set("n", "<leader>xl", "<Plug>RestNvimLast")

-- goto-preview
vim.keymap.set("n", "gp", function()
  require("goto-preview").goto_preview_definition()
end)

-- no neck pain single keybinding
vim.keymap.set({ "n", "v" }, "<Leader>np", "<Cmd>NoNeckPain<CR>", opts)

-- gen nvim mappings
-- vim.keymap.set({ "n", "v" }, "<Leader>]", ":Gen<CR>", opts)

-- overseer commands
-- override old c-o to c-a
-- vim.api.nvim_set_keymap("n", "<c-a>", "<c-o>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<c-o>", function()
--   vim.cmd("OverseerRun")
-- end, opts)
--
-- --
-- vim.keymap.set({ "n", "v" }, "<c-t>", function()
--   vim.cmd("OverseerToggle")
-- end, opts)
--
-- -- no neck pain
-- vim.keymap.set({ "n", "v" }, "<c-m>", function()
--   vim.cmd("NoNeckPain")
-- end)

--- META
-- open config file
vim.keymap.set({ "n", "v" }, "<leader>rc", ":e $MYVIMRC<cr>", opts)

-- open keymap file
vim.keymap.set({ "n", "v" }, "<leader>kb", ":e ~/.config/nvim/lua/config/keymaps.lua<cr>", opts)

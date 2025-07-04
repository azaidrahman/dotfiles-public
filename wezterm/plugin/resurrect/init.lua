-- https://mwop.net/blog/2024-10-21-wezterm-resurrect.html
-- File: resurrect/config.lua
-- resurrect.wezterm configuration and settings
--
-- This module:
-- * Configures the resurrect.wezterm plugin
-- * Configures event listener configuration (via an additional required file)
-- * Returns wezterm keybinding configuration for resurrect-related actions.
--
-- The main wezterm configuration is then responsible for merging the
-- keybindings with other keybindings, or setting up its own.
-- local config = {}
local wezterm = require('wezterm')
print('im here')
wezterm.log_info('im here')
local resurrect = wezterm.plugin.require('https://github.com/MLFlexer/resurrect.wezterm')
-- local resurrect = wezterm.plugin.require('../../../wezterm.plugins/resurrect')
-- local resurrect = wezterm.plugin.require('%USERPROFILE%/.config/wezterm.plugins/resurrect/')
-- local resurrect = wezterm.plugin.require('resurrect')
-- local workspace_switcher =
-- wezterm.plugin.require('https://github.com/MLFlexer/smart_workspace_switcher.wezterm')

-- resurrect.wezterm encryption
-- Uncomment the following to use encryption.
-- If you do, ensure you have the age tool installed, you have created an
-- encryption key at ~/.config/age/wezterm-resurrect.txt, and that you supply
-- the associated public_key below
-- resurrect.set_encryption(h
--     enable      = true,
--     method      = "age",
--     private_key = wezterm.home_dir .. "/.config/age/wezterm-resurrect.txt",
--     public_key  = "THE-PUBLIC-KEY-VALUE-GOES-HERE",
-- })

-- resurrect.wezterm periodic save every 5 minutes
resurrect.periodic_save({
   interval_seconds = 300,
   save_tabs = true,
   save_windows = true,
   save_workspaces = true,
})
--
-- Save only 5000 lines per pane
resurrect.set_max_nlines(5000)

-- Default keybindings
-- These will need to be merged with the main wezterm keys.
local keybindings = {
   {
      -- Save current and window state
      -- See https://github.com/MLFlexer/resurrect.wezterm for options around
      -- saving workspace and window state separately
      key = 's',
      mods = 'LEADER',
      action = wezterm.action_callback(function(win, pane) -- luacheck: ignore 212
         local state = resurrect.workspace_state.get_workspace_state()
         resurrect.state_manager.save_state(state)
         resurrect.window_state.save_window_action()
      end),
   },
   {
      -- Load workspace or window state, using a fuzzy finder
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action_callback(function(win, pane)
         resurrect.fuzzy_load(win, pane, function(id, label) -- luacheck: ignore 212
            local type = string.match(id, '^([^/]+)') -- match before '/'
            id = string.match(id, '([^/]+)$') -- match after '/'
            id = string.match(id, '(.+)%..+$') -- remove file extension

            local opts = {
               window = win:mux_window(),
               relative = true,
               restore_text = true,
               on_pane_restore = resurrect.tab_state.default_on_pane_restore,
            }

            if type == 'workspace' then
               local state = resurrect.load_state(id, 'workspace')
               resurrect.workspace_state.restore_workspace(state, opts)
            elseif type == 'window' then
               local state = resurrect.load_state(id, 'window')
               -- opts.tab = win:active_tab()
               resurrect.window_state.restore_window(pane:window(), state, opts)
            elseif type == 'tab' then
               local state = resurrect.load_state(id, 'tab')
               resurrect.tab_state.restore_tab(pane:tab(), state, opts)
            end
         end)
      end),
   },
   {
      -- Delete a saved session using a fuzzy finder
      key = 'd',
      mods = 'LEADER',
      action = wezterm.action_callback(function(win, pane)
         resurrect.fuzzy_load(win, pane, function(id)
            resurrect.delete_state(id)
         end, {
            title = 'Delete State',
            description = 'Select session to delete and press Enter = accept, Esc = cancel, / = filter',
            fuzzy_description = 'Search session to delete: ',
            is_fuzzy = true,
         })
      end),
   },
}

-- M.setup = function()
--    wezterm.on('augment-command-palette', function(window, pane)
--       local workspace_state = resurrect.workspace_state
--       return {
--          {
--             brief = 'Window | Workspace: Switch Workspace',
--             icon = 'md_briefcase_arrow_up_down',
--             action = workspace_switcher.switch_workspace(),
--          },
--          {
--             brief = 'Window | Workspace: Rename Workspace',
--             icon = 'md_briefcase_edit',
--             action = wezterm.action.PromptInputLine({
--                description = 'Enter new name for workspace',
--                action = wezterm.action_callback(function(window, pane, line)
--                   if line then
--                      wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
--                      resurrect.state_manager.save_state(workspace_state.get_workspace_state())
--                   end
--                end),
--             }),
--          },
--       }
--    end)
-- end

local M = {}
M.keys = keybindings
-- require('resurrect/events')

return M

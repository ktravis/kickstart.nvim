vim.keymap.set('n', ';', ':', { nowait = true })
vim.keymap.set('n', 'H', '^', { desc = 'Go to beginning of line', nowait = true })
vim.keymap.set('n', 'L', '$', { desc = 'Go to end of line', nowait = true })
vim.keymap.set('v', 'H', '^', { desc = 'Go to beginning of line', nowait = true })
vim.keymap.set('v', 'L', '$', { desc = 'Go to end of line', nowait = true })
vim.keymap.set('i', 'jk', '<esc>', { silent = true, nowait = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local build_and_run = function()
  require("rustaceanvim.cached_commands").execute_last_runnable()
end
vim.keymap.set('n', '<F5>', build_and_run, { nowait = true })

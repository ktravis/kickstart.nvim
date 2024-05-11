-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- local exec = {}
--
-- function exec.execute_command(command, args, cwd)
--   local ok, term = pcall(require, 'nvterm.terminal')
--   if not ok then
--     vim.schedule(function()
--       vim.notify('nvterm not found.', vim.log.levels.ERROR)
--     end)
--     return
--   end
--
--   local shell = require('rustaceanvim.shell')
--   local cmd = shell.make_command_from_args(command, args)
--   term.send(cmd)
-- end

vim.g.rustaceanvim = {
  -- Plugin configuration
  -- tools = {
  --   executor = exec
  -- },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      vim.lsp.inlay_hint.enable(bufnr, true)
      if vim.g.lsp_on_attach ~= nil then
        vim.g.lsp_on_attach(client, bufnr)
      end
    end,
    settings = {
      ['rust-analyzer'] = {},
    },
  },
  -- DAP configuration
  dap = {
  },
}

return {
  { "tpope/vim-surround" },
  {
    "mrcjkb/rustaceanvim",
    version = '^3',
    ft = { 'rust' },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    -- opts = {
    --   -- Plugin configuration
    --   tools = {
    --     executor = exec
    --   },
    --   -- LSP configuration
    --   server = {
    --     on_attach = function(client, bufnr)
    --       vim.lsp.inlay_hint.enable(bufnr, true)
    --     end,
    --     settings = {
    --       ['rust-analyzer'] = {},
    --     },
    --   },
    --   -- DAP configuration
    --   dap = {
    --   },
    -- },
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          require "crates"
        end,
      })
    end,
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  }
}

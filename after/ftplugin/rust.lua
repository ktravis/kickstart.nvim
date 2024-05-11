local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local bufnr = vim.api.nvim_get_current_buf()
local opts = {
  mode = "n",
  prefix = nil,
  buffer = bufnr,
  silent = true,
  noremap = true,
  nowait = true,
}

which_key.register({
  J = { "<cmd>RustLsp joinLines<cr>", "Join lines" },
}, opts)

which_key.register({
  R = {
    name = "+[R]ust",
    g = { "<cmd>RustLsp crateGraph<cr>", "Show crate [g]raph" },
    m = { "<cmd>RustLsp expandMacro<cr>", "Expand [m]acro" },
    K = { "<cmd>RustLsp externalDocs<cr>", "Open external docs" },
    r = { "<cmd>RustLsp runnables<cr>", "[r]unnables" },
    R = { "<cmd>RustLsp runnables last<cr>", "Last [R]unnable" },
    d = { "<cmd>RustLsp debuggables<cr>", "[d]ebuggables" },
    W = { "<cmd>RustLsp reloadWorkspace<cr>", "Reload [W]orkspace" },
    C = { "<cmd>RustLsp openCargo<cr>", "Open [C]argo.toml" },
  },
  C = {
    name = "+Rust [C]rates",
    p = { "<cmd>lua require('crates').show_popup()<CR>", "Show [p]opup" },
    r = { "<cmd>lua require('crates').reload()<CR>", "[r]eload" },
    v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show [v]ersions" },
    f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show [f]eatures" },
    d = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show [d]ependencies Popup" },
    u = { "<cmd>lua require('crates').update_crate()<CR>", "[u]pdate Crate" },
    a = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update [a]ll Crates" },
    U = { "<cmd>lua require('crates').upgrade_crate<CR>", "[U]pgrade Crate" },
    A = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", "Upgrade [A]ll Crates" },
    H = { "<cmd>lua require('crates').open_homepage()<CR>", "Open [H]omepage" },
    R = { "<cmd>lua require('crates').open_repository()<CR>", "Open [R]epository" },
    D = { "<cmd>lua require('crates').open_documentation()<CR>", "Open [D]ocumentation" },
    C = { "<cmd>lua require('crates').open_crates_io()<CR>", "Open [C]rates.io" },
  }
}, {
  mode = "n",
  prefix = "<leader>",
  buffer = bufnr,
  silent = true,
  noremap = true,
  nowait = true,
})

-- vim: ts=2 sts=2 sw=2 et

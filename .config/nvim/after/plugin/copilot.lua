-- for zbirenbaum/copilot.lua
-- some settings are in cmp.lua
require("copilot").setup({
  panel = { enabled = false },
  suggestion = { enabled = false },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
    ["*"] = true, -- disable for all other filetypes and ignore default `filetypes`
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#fbe1ea" })

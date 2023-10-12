local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>M", mark.add_file)
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-k>", function()
  ui.nav_prev()
end)
vim.keymap.set("n", "<C-j>", function()
  ui.nav_next()
end)

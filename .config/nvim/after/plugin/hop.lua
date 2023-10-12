require("hop").setup()
vim.keymap.set("n", "<leader>l", vim.cmd.HopLineStart)
vim.keymap.set("n", "<leader>w", vim.cmd.HopWord)
vim.keymap.set("n", "<leader>/", vim.cmd.HopPattern)

local fzflua = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzflua.files, {})
vim.keymap.set("n", "<leader>fg", fzflua.live_grep, {})
vim.keymap.set("n", "<leader>fG", fzflua.grep, {})
vim.keymap.set("n", "<leader>fh", fzflua.command_history, {})
vim.keymap.set("n", "<leader>:", fzflua.commands, {})

-- open fzf when starting empty neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      fzflua.files()
    end
  end,
})

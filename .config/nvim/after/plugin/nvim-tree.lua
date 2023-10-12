-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup with some options
vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-N>", vim.cmd.NvimTreeFindFileToggle)

require("nvim-tree").setup({
  hijack_cursor = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    number = true,
    relativenumber = true,
    width = 30,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    full_name = true,
    highlight_opened_files = "name",
    highlight_modified = "name",
    highlight_bookmarks = "name",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        folder_arrow = true,
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  trash = {
    cmd = "safe-rm -rf",
  },
  filters = {
    dotfiles = true,
  },
})

-- automatically close the tab/vim when nvim-tree is the last window in the tab
vim.api.nvim_create_autocmd("BufEnter", {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})

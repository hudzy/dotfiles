--- remaps
vim.g.mapleader = " "
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
-- move selected lines
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
-- make yank consistent with Delete Change
vim.keymap.set("n", "Y", "y$")
-- Visual shifting (does not exit Visual mode)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- select all
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("n", "<leader>y", "ggVGy")
-- vsplit and hsplit
vim.keymap.set("n", "<leader>g", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>G", vim.cmd.split)
-- quicker new tab
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
-- quicker tab navigation, move to the previous/next tabpage
vim.keymap.set("n", "<leader><tab>", "gt")
vim.keymap.set("n", "<leader><s-tab>", "gT")
-- keep cursor position for concatenating lines
-- vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in middle during half-page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in middle during search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- paste/delete without polutting clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- bash emacs-like editing in vim
vim.keymap.set("i", "<C-b>", "<C-o>h")
vim.keymap.set("i", "<C-f>", "<C-o>l")
vim.keymap.set("i", "<C-a>", "<C-o>0")
vim.keymap.set("i", "<C-e>", "<C-o>$")
vim.keymap.set("i", "<C-d>", "<C-o>x")
vim.keymap.set("i", "<C-x>", '<C-o>"_dw')
-- add execute permission to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- replace the word where cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- quicker :so
vim.keymap.set("n", "<leader><leader>", vim.cmd.so)
-- quicker :PackerSync
vim.keymap.set("n", "<leader><leader><leader>", vim.cmd.PackerSync)
-- exit terminal buffer insert mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- toggle wrap
vim.keymap.set("n", "<leader>W", function()
  vim.cmd("set wrap!")
end)
-- toggle list spaces and line delimiters
vim.cmd("set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:•")
vim.keymap.set("n", "<leader>L", function()
  vim.cmd("set list!")
end)
-- toggle diagnostics
vim.diagnostic.config({ virtual_text = false })
local diagnostics_virtual_text = false
vim.keymap.set("n", "<leader>D", function()
  diagnostics_virtual_text = not diagnostics_virtual_text
  if diagnostics_virtual_text then
    vim.diagnostic.config({ virtual_text = true })
  else
    vim.diagnostic.config({ virtual_text = false })
  end
end)

--- settings
-- basics
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.shortmess = "ac"
vim.opt.signcolumn = "auto:1-3"
vim.opt.smartcase = true
-- fix for broken cmp search highlight
vim.api.nvim_create_autocmd("CmdLineEnter", {
  pattern = { "/", "?" },
  command = "set nohlsearch",
})
vim.api.nvim_create_autocmd("CmdLineLeave", {
  pattern = { "/", "?" },
  command = "set hlsearch",
})
-- set ignorecase in command mode, enhance cmp search experience
vim.api.nvim_create_autocmd("CmdLineEnter", {
  pattern = ":",
  command = "set ignorecase",
})
vim.api.nvim_create_autocmd("CmdLineLeave", {
  pattern = ":",
  command = "set smartcase",
})
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1200
vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 4
vim.opt.pumwidth = 10
vim.opt.pumheight = 15
vim.opt.colorcolumn = "80"
vim.opt.foldenable = false

-- better indentations
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- set undo backup swp directory path
local conf_dir = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~")
vim.opt.backup = false
--vim.opt.backupdir = { conf_dir .. "/.nvimbackup//"}
vim.opt.undofile = true -- enabled for undotree plugin
vim.opt.undodir = { conf_dir .. "/.nvimundo//" }
vim.opt.swapfile = false
--vim.opt.directory = { conf_dir .. "/.nvimswp//"}

-- set nowrap for kubeconfig files and Jenkinsfiles and helm chart yamls
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/.kube/config*",
    "*templates/*.yaml",
    "*templates/*.yml",
  },
  callback = function()
    vim.cmd("setlocal filetype=yaml")
    vim.cmd("setlocal nowrap")
  end,
})

-- set filetype as Groovy for all Jenkinsfiles
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*Jenkinsfile*",
  callback = function()
    vim.cmd("setlocal filetype=groovy")
    vim.cmd("setlocal nowrap")
  end,
})

-- set type as bash for all tutorials
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/tutorials/*.txt",
  command = "setlocal filetype=bash",
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300, priority = "vim.highlight.priorities.syntax" })
  end,
})

-- set line numbers and cursor column, called by color.lua
-- to see all current highlight, run :highlight
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#00afff", bold = false })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#d7005f", bold = false })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#D4D4D4", bg = "#444444", bold = true })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#444444" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#444444" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#9399b2", bg = "#262626" }) -- default bg:#2b2b3c
    vim.api.nvim_set_hl(0, "NonText", { fg = "#585858" })
    vim.api.nvim_set_hl(0, "Whitespace", { fg = "#585858" })
    vim.api.nvim_set_hl(0, "CurSearch", { fg = "#fa9b9b", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "Search", { fg = "#c75a5a", underline = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#57596a", underline = true, bold = true }) -- default bg:#45475a
    vim.api.nvim_set_hl(0, "LocalHighlight", { underline = true }) -- for tzachar/local-highlight.nvim
    -- vim.api.nvim_set_hl(0, "ExtraWhitespace", { fg = "#585858", bg = "#d70000", underline = false }) -- for vim-better-whitespace
    vim.api.nvim_set_hl(0, "ExtraWhitespace", { link = "@text.danger" }) -- for vim-better-whitespace
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#949494", bg = "NONE", underline = true }) -- for gitsigns plugin to set blame text color
    -- enhance cmp fuzzy search color
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = false }) -- for cmp
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6", bold = true, italic = false })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#45475a" })
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#89b4fa", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#f38ba8", bold = true })
    vim.api.nvim_set_hl(0, "@function.builtin.bash", {}) -- clear default bash keyword highlight
    vim.api.nvim_set_hl(0, "@namespace", { link = "Function" }) -- change default namespace highlight
    vim.api.nvim_set_hl(0, "@text.uri", { fg = "#89dceb", underline = true }) -- change default uri highlight
    vim.api.nvim_set_hl(0, "MsgArea", { fg = "#D4D4D4" })
  end,
})

--- fix calling yamlls LSP server for helm filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*templates/*.yaml",
    "*templates/*.yml",
    "*templates/*.tpl",
    "*.gotmpl",
  },
  command = "setlocal filetype=helm",
})

--- set python requirement.txt and .env filetype to config
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.env",
    "requirement*.txt",
  },
  command = "setlocal filetype=config",
})

-- Experimental
-- vim.cmd("highlight clear TODO")
-- vim.cmd("highlight link TODO Comment")

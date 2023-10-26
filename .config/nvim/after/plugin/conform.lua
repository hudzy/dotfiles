require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" }, -- brew install stylua
    python = { "isort", "black" }, -- brew install isort black
    helm = { "prettier" }, -- brew install prettier
    yaml = { "prettier" },
    text = { "codespell", "trim_newlines", "trim_whitespace" },
    markdown = { "prettier", "codespell" }, -- brew install codespell
    json = { "prettier" },
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    -- shellharden is a strict version of shellcheck
    sh = { "shellharden", "shfmt" }, -- brew install shellharden shfmt
    bash = { "shellharden", "shfmt" },
    zsh = { "shellharden", "shfmt" },
    sql = { "sql_formatter" }, -- npm install sql-formatter -g
    ["_"] = { "trim_newlines", "trim_whitespace" },
    -- ["*"] = { "codespell" },
  },
})

-- format_on_save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    if vim.bo.filetype ~= "sh" and vim.bo.filetype ~= "bash" and vim.bo.filetype ~= "zsh" then -- ignore formatting for shell scripts
      require("conform").format({
        async = false,
        lsp_fallback = false,
        timeout_ms = 1000,
        bufnr = args.buf,
        -- formatters = { "codespell", "trim_newlines", "trim_whitespace" },
      })
    end
  end,
})

-- add a sleep to fix :wq exit error code 134
-- Source: https://www.reddit.com/r/neovim/comments/14bcfmb/nonzero_exit_code/jogoeku/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 10m")
  end,
})

-- set custom config for stylua
require("conform.formatters.stylua").args = function(ctx)
  local args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" }
  local found = vim.fs.find("stylua.toml", { path = "~/.config/nvim/linter-configs/" })[1]
  if found then
    vim.list_extend(args, { "--config-path", found })
  end
  return args
end

-- set custom config for prettier
require("conform.formatters.prettier").args = function(ctx)
  local args = { "--stdin-filepath", "$FILENAME" }
  local found = vim.fs.find("prettier.toml", { path = "~/.config/nvim/linter-configs/" })[1]
  if found then
    vim.list_extend(args, { "--config", found })
  end
  return args
end

-- set custom config for codespell
require("conform.formatters.codespell").args = function(ctx)
  local args = { "$FILENAME", "--write-changes", "--check-hidden" }
  local found = vim.fs.find("codespell-ignore-words", { path = "~/.config/nvim/linter-configs/" })[1]
  if found then
    vim.list_extend(args, { "--ignore-words", found })
  end
  return args
end

-- Define a command and keymap for async formatting
vim.api.nvim_create_user_command("ConformFormat", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({
    async = false,
    lsp_fallback = false,
    range = range,
  })
end, { range = true })
vim.keymap.set({ "n", "v" }, "<leader>F", vim.cmd.ConformFormat)

-- Define a command and keymap for async codespell lint
vim.api.nvim_create_user_command("ConformSpell", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({
    async = false,
    lsp_fallback = false,
    range = range,
    formatters = { "codespell", "trim_newlines", "trim_whitespace" },
  })
end, { range = true })

vim.keymap.set({ "n", "v" }, "<leader>S", vim.cmd.ConformSpell)

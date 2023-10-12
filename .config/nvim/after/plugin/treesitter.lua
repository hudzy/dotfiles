require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "css",
    "csv",
    "dockerfile",
    "git_config",
    "gitcommit",
    "gitignore",
    "go",
    "groovy",
    "hcl",
    "html",
    "http",
    "ini",
    "javascript",
    "jq",
    "json",
    "kconfig",
    "lua",
    "make",
    "markdown_inline",
    "php",
    "python",
    "regex",
    "ruby",
    "rust",
    "sql",
    "ssh_config",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "xml",
    "yaml",
  },

  sync_install = false,

  auto_install = true,

  ignore_install = {},

  highlight = {
    enable = true, -- `false` will disable the whole extension
    disable = {},
    disable = function(lang, buf)
      local max_filesize = 300 * 1024 -- 300 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
})

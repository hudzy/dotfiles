-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/lsp-zero.txt
-- keymaps
-- see :help lsp-zero-keybindings
-- <Ctrl-y>: Confirms selection.
-- <Ctrl-e>: Cancel the completion.
-- <Down>: Navigate to the next item on the list.
-- <Up>: Navigate to previous item on the list.
-- <Ctrl-n>: Go to the next item in the completion menu, or trigger completion menu.
-- <Ctrl-p>: Go to the previous item in the completion menu, or trigger completion menu.

--- lsp_zero configs
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

--- mason configs
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "dotls",
    "gopls",
    "helm_ls",
    "html",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    -- "pylsp", -- stricter than pyright
    "pyright",
    "sqlls",
    "taplo",
    "tsserver",
    "vimls",
    "yamlls",
    -- 'groovyls', -- not very useful
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      -- (Optional) configure lua language server
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
    yamlls = function()
      local schema_path = vim.fs.find("yamlls-schemas", { path = "~/.config/nvim/", type = "directory" })[1]
      require("lspconfig").yamlls.setup({
        settings = {
          yaml = {
            validate = true,
            schemas = {
              -- https://github.com/yannh/kubernetes-json-schema/
              [schema_path .. "/v1.23.1-standalone/all.json"] = {
                "*k8s*/*.{yml,yaml}",
                "*k8s*/*/*.{yml,yaml}",
                "*k8s*/*/*/*.{yml,yaml}",
                "*k8s*/*/*/*/*.{yml,yaml}",
              },
              [schema_path .. "/docker-compose.json"] = "*docker-compose*.{yml,yaml}",
              [schema_path .. "/github-workflow.json"] = "*.github/workflows/*.{yml,yaml}",
              [schema_path .. "/github-action.json"] = "*.github/action.{yml,yaml}",
              -- [schema_path .. "/helm-chart.json"] = "*Chart.{yml,yaml}",
              -- [schema_path .. "/ansible-playbook.json"] = "*play*.{yml,yaml}",
            },
          },
        },
      })
    end,

    -- Experimental
    -- helm_ls = function()
    --   require("lspconfig").helm_ls.setup({
    --     filetypes = { "helm" },
    --     cmd = { "helm_ls", "serve" },
    --     root_dir = function(fname)
    --       return require("lspconfig.util").root_pattern("Chart.yaml")(fname)
    --     end,
    --   })
    -- end,
  },
})

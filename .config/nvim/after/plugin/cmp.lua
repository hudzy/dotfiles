--- cmp configs
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  preselect = "item",
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    col_offset = -3,
    side_padding = 0,
  },
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 33,
        ellipsis_char = "...",
        symbol_map = { Copilot = "" },
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "

      return kind
    end,
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "copilot", group_index = 2 }, --copilot source
    { name = "nvim_lsp", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "buffer", max_item_count = 15, group_index = 2 },
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

    -- Scroll up and down in the completion documentation
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  view = {
    -- entries = { name = 'custom', selection_order = 'top_down' },
    entries = { name = "wildmenu", separator = " • " },
    docs = { auto_open = false },
  },
  formatting = {
    expandable_indicator = false,
    fields = { "abbr" },
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {
      name = "buffer",
      max_item_count = 20,
      -- option = {
      --   keyword_length = 5,
      -- }
    },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  view = {
    entries = { name = "custom", selection_order = "top_down" },
    -- entries = {name = 'wildmenu', separator = ' • ' },
    docs = { auto_open = false },
  },
  formatting = {
    expandable_indicator = false,
    -- fields = { 'abbr' },
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      local kind =
        require("lspkind").cmp_format({ mode = "symbol", maxwidth = 33, ellipsis_char = "..." })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = "" .. (strings[1] or "") .. ""

      return kind
    end,
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

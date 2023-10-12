require("alternate-toggler").setup({
  alternates = {
    ["true"] = "false",
    ["True"] = "False",
    ["TRUE"] = "FALSE",
    ["Yes"] = "No",
    ["YES"] = "NO",
    ["1"] = "0",
    ["<"] = ">",
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ['"'] = "'",
    ['""'] = "''",
    ["+"] = "-",
    ["=="] = "!=",
    ["==="] = "!==",
  },
})

vim.keymap.set("n", "<leader>t", vim.cmd.ToggleAlternate)

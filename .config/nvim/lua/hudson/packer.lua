vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- packer.nvim
  use("wbthomason/packer.nvim")

  -- colorscheme
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- file bookmarks
  use({
    "theprimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
  })

  -- file tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- file edit history
  use("mbbill/undotree")

  -- git
  use("tpope/vim-fugitive")

  -- indent line
  use("lukas-reineke/indent-blankline.nvim")

  -- show git diff markers in the sign column
  use("lewis6991/gitsigns.nvim")

  -- toggle terminal
  use("s1n7ax/nvim-terminal")

  -- enhanced sidebar registers
  use("junegunn/vim-peekaboo")

  -- universal set of defaults
  use("tpope/vim-sensible")

  -- highlight the word under the cursor
  use("tzachar/local-highlight.nvim")

  -- jump anywhere in a document
  use("smoka7/hop.nvim")

  -- indent-level based motion
  use("jeetsukumaran/vim-indentwise")

  -- automatic closing of quotes, parenthesis, brackets, etc.
  use("Raimondi/delimitMate")

  -- add/delete/replace surroundings of a sandwiched textobject
  use("machakann/vim-sandwich")

  -- alignment plugin
  use("junegunn/vim-easy-align")

  -- toggling alternate boolean values
  use("rmagatti/alternate-toggler")

  -- beautify comments using boxes and lines
  use("LudoPinelli/comment-box.nvim")

  -- vim syntax for helm templates (yaml + gotmpl + sprig + custom)
  use("towolf/vim-helm")

  -- status line
  use("freddiehaddad/feline.nvim")

  -- fzf fuzzyfinder
  use({
    "ibhagwan/fzf-lua",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- commenting
  use("preservim/nerdcommenter")

  -- folding configuration for YAML
  use("pedrohdz/vim-yaml-folds")

  -- LSP config
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      -- manage LSP servers from neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- LSP Support
      "neovim/nvim-lspconfig",

      -- nvim-cmp autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",

      -- cmp enhanced
      "onsails/lspkind.nvim",
    },
  })

  -- language formatter
  use("stevearc/conform.nvim")

  -- highlight trailing spaces
  use("ntpeters/vim-better-whitespace")

  -- highlight go.mod
  use("maralla/gomod.vim")

  -- live colorizer
  use("NvChad/nvim-colorizer.lua")

  --- Experimental
  -- tabline
  -- use({
  --   "willothy/nvim-cokeline",
  --   requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  -- })

  -- auto no highlight after search
  -- use("romainl/vim-cool")

  -- GitHub CoPilot
  -- use("github/copilot.vim")
  use("zbirenbaum/copilot.lua")

  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  })
end)

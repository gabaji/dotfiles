local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call to require lazy
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Configure lazy.nvim
lazy.setup({
  {
    "folke/lazy.nvim",
    version = "*"
  },
  "nvim-lua/plenary.nvim",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    lazy = false,
  },
  "kyazdani42/nvim-web-devicons",
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  "moll/vim-bbye",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
  },
  {
    "goolord/alpha-nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },

  -- Colorschemes
  "folke/tokyonight.nvim",
  "lunarvim/darkplus.nvim",

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
      },
    },
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
      },
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  "RRethy/vim-illuminate",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Telescope",
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
  },
  "f-person/git-blame.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "mbbill/undotree",
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
  },
  "rebelot/kanagawa.nvim",
  "mfussenegger/nvim-dap-python",
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
    cmd = "Glow",
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "thenbe/markdown-todo.nvim",
    ft = { "md", "markdown" },
    config = function()
      require("markdown-todo").setup()
    end,
  },
}, {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    notify = false,
  },
})

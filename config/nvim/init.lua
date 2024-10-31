-- Plugin Management
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_absent = vim.fn.empty(vim.fn.glob(packer_path)) > 0
if packer_absent then
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
  vim.cmd([[packadd packer.nvim]])
end
require("packer").startup(function(use)
  use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help", "onsails/lspkind.nvim" } })
  use({ "ibhagwan/fzf-lua", requires = { "junegunn/fzf", run = "./install --bin" } })
  use({ "jay-babu/mason-null-ls.nvim", requires = { "nvimtools/none-ls.nvim", "williamboman/mason.nvim" } })
  use({ "lewis6991/gitsigns.nvim", config = [[require('gitsigns').setup({current_line_blame_opts={delay=0}})]] })
  use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" }, config = [[require('nvim-tree').setup({})]] })
  use({ "nvim-treesitter/nvim-treesitter", tag = "*", run = ":TSUpdate" })
  use({ "rebelot/kanagawa.nvim", config = [[require('kanagawa').load()]] })
  use({ "saadparwaiz1/cmp_luasnip", requires = { "L3MON4D3/LuaSnip" } })
  use({ "vim-airline/vim-airline", requires = { "edkolev/promptline.vim", "edkolev/tmuxline.vim" } })
  use({ "wbthomason/packer.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "williamboman/mason-lspconfig.nvim", requires = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" } })
  if packer_absent then require("packer").sync() end
end)

-- Airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline_powerline_fonts"] = 1
vim.cmd("let g:promptline_preset = {'a': [promptline#slices#vcs_branch()], 'c': [promptline#slices#cwd({'dir_limit': 4})]}")

-- LSP
local cmp = require("cmp")
cmp.setup({
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = { format = require("lspkind").cmp_format({ format = "symbol_text", maxwidth = 64, ellipsis_char = "..." }) },
  sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "nvim_lsp_signature_help" } }),
})
vim.g.python3_host_prog = "/usr/bin/python"
require("mason").setup({})
require("mason-lspconfig").setup_handlers({
  function(server) require("lspconfig")[server].setup({ capabilities = require("cmp_nvim_lsp").default_capabilities() }) end,
})
require("null-ls").setup({})
require("mason-null-ls").setup({ handlers = {} })

-- Syntax
require("nvim-treesitter.configs").setup({
  auto_install = true,
  indent = { enable = true },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
})
require("kanagawa").setup({
  dimInactive = true,
  colors = {
    palette = { sumiInk1 = "#080808", waveBlue1 = "#262626" },
    theme = { all = { ui = { bg = "none", bg_gutter = "none", bg_p2 = "none", bg_p1 = "#080808" } } },
  },
})

-- Miscellaneous Options
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.number = true
vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

-- Autosave
vim.o.swapfile = false
vim.cmd("au BufLeave,CursorHold,FocusLost * if (getbufinfo('%')[0].changed) | do BufWritePre | sil! up | do BufWritePost | endif")

-- Indent Guides
vim.o.list = true
vim.cmd("au BufEnter * execute 'setlocal listchars=trail:·,tab:│\\ ,leadmultispace:┆' . repeat('\\ ', &shiftwidth - 1)")

-- Leader Mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>a", require("fzf-lua").lsp_finder)
vim.keymap.set("n", "<leader>o", require("fzf-lua").grep)
vim.keymap.set("n", "<leader>e", require("fzf-lua").grep_cword)
vim.keymap.set("n", "<leader>u", function() require("gitsigns").setqflist("all") end)
vim.keymap.set("n", "<leader>i", function() require("gitsigns").blame_line({ full = true }) end)
vim.keymap.set("n", "<leader>d", function() require("nvim-tree.api").tree.toggle({ find_file = true, update_root = true }) end)
vim.keymap.set("n", "<leader>hs", require("gitsigns").stage_hunk)
vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk)
vim.keymap.set("n", "<leader>hu", require("gitsigns").undo_stage_hunk)
vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk)
vim.keymap.set("n", "<leader>t", require("fzf-lua").files)
vim.keymap.set("n", "<leader>n", require("fzf-lua").buffers)
vim.keymap.set("n", "<leader>s", function() vim.fn.setreg("+", vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>p", function() vim.cmd(":cclose") end)
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ timeout_ms = 3000 }) end)
vim.keymap.set("n", "<leader>g", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>c", require("fzf-lua").lsp_code_actions)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>l", vim.lsp.buf.hover)

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	use("folke/tokyonight.nvim") -- Tokyo Night
	use({ "catppuccin/nvim", as = "catppuccin" }) -- Catppuccin (todas variantes)
	use("ellisonleao/gruvbox.nvim") -- Gruvbox Retro
	use("marko-cerovac/material.nvim") -- Material Sakura
	use("rose-pine/neovim") -- Rosé Pine
	use("Mofiqul/vscode.nvim") -- Frosted Glass (VSCode theme, alternativa)
	use("EdenEast/nightfox.nvim") -- Edge Runner (Nightfox family, alternativa)
	use("shaunsingh/nord.nvim") -- Nordic Blue
	use("kvrohit/rasmus.nvim") -- Graphite Mono (alternativa próxima)
	use("samharju/synthweave.nvim") -- Synth Wave
	use("decaycs/decay.nvim") -- Decay Green

	-- tmux & split-navigation
	use("christoomey/vim-tmux-navigator")

	-- maximixes and restores current window
	use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround") -- ysw (surround) / ds->simbolo (delete) / change cs->simbolo->newsimbol
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- managing & installing lsp servers, linters e formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- formatters
	use("nvimtools/none-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	--auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("lewis6991/gitsigns.nvim") -- git signs

	use("goolord/alpha-nvim") -- dashboard

	use("stevearc/dressing.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
end

vim.cmd [[packadd packer.nvim]]

local _packer, packer = pcall(require, "packer")

if not _packer then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer.startup(function(use)
    use { "lewis6991/impatient.nvim" }
    use { "wbthomason/packer.nvim" }
    use { "glepnir/dashboard-nvim" }
    use { "Mofiqul/dracula.nvim" }
    use { "ellisonleao/gruvbox.nvim" }
    use { "sainnhe/gruvbox-material", }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "tpope/vim-surround" }
    use { "preservim/nerdtree" }
    use { "ryanoasis/vim-devicons" }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

    -- empty setup using defaults
    require("nvim-tree").setup()
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
    }

    require('lualine').setup()
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter",
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    }

    use { "tpope/vim-commentary", event = "VimEnter" }

    use { "folke/which-key.nvim" }

    use { "mattn/emmet-vim" }

    use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }

    use { 
        "ggandor/leap.nvim",
        config = function() 
            require "plugins.configs.leap"
        end,
    }

    use { 
        "lervag/vimtex",
        config = function()
            require "plugins.configs.vimtex"
        end,
    }

    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            require "plugins.configs.coc"
        end,
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

local plugins = {
    { 'blazkowolf/gruber-darker.nvim' },
    { 'navarasu/onedark.nvim' },
    { 'nvim-tree/nvim-web-devicons' },

    { 'nvim-lua/plenary.nvim', tag = 'v0.1.4' },

    { 'nvim-lualine/lualine.nvim' },
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6' },

    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'fedepujol/move.nvim' },
    { 'windwp/nvim-autopairs' },
    { 'terrortylor/nvim-comment' },
    { 'christoomey/vim-tmux-navigator' },
    { 'mg979/vim-visual-multi' },
    { 'romgrk/barbar.nvim' },

    { 'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        },
    },
    { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
    },
}

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    local packer_repo  = 'https://github.com/wbthomason/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

packer.startup(function(use)
    use('wbthomason/packer.nvim')
    use(plugins)

    if packer_bootstrap then
        packer.sync()
        print '=================================='
        print '    Plugins are being installed'
        print '    Wait until Packer completes,'
        print '       then restart nvim'
        print '=================================='
    end
end)

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

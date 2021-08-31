d = {}

function d.nmap(lhs, rhs)
	return vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = false, silent = true })
end

function d.nnoremap(lhs, rhs)
	return vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

function d.nnoremap_ns(lhs, rhs)
	return vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true })
end

function d.inoremap(lhs, rhs)
	return vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end

function d.cnoremap(lhs, rhs)
	return vim.api.nvim_set_keymap('c', lhs, rhs, { noremap = true, silent = true })
end

function d.vnoremap(lhs, rhs)
	return vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end

function d.vnoremap_ns(lhs, rhs)
	return vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true })
end

function d.indent(indent, width)
	vim.o.shiftwidth = width
	vim.o.tabstop = width
	if indent == 'tab' then
		vim.o.expandtab = false
		vim.o.softtabstop = 0
	else
		vim.o.expandtab = true
		vim.o.softtabstop = width
	end
end

--[[ PACKER ]]--
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command('packadd packer.nvim')
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'lifepillar/vim-solarized8'
	use 'christoomey/vim-tmux-navigator'
	use 'ap/vim-buftabline'
	use 'tpope/vim-sleuth'
	use {
		'hoob3rt/lualine.nvim'
	}
	-- Linux only
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}
	use 'kyazdani42/nvim-tree.lua'
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'RishabhRD/popfix'},
			{'RishabhRD/nvim-lsputils'},
			{'ray-x/lsp_signature.nvim'}
		}
	}
	use {
		'ojroques/nvim-lspfuzzy',
		requires = {
			{'junegunn/fzf'},
			{'junegunn/fzf.vim'},  -- to enable preview (optional)
		},
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
end)

--[[ VARIALBES ]]--
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--[[ SOLARIZED8 ]]--
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.solarized_extra_hi_groups = 1
vim.cmd('colorscheme solarized8_flat')

--[[ OPTIONS ]]--
vim.o.swapfile = false
vim.o.autochdir = true			-- set working dir to current file
vim.o.showmatch = true			-- show matching brackets
vim.o.cursorline = true			-- highlight current line
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.colorcolumn = '80,100'		-- Linux standard
vim.o.sidescroll = 5			-- speedup horizontal scroll
vim.o.timeoutlen = 500
vim.o.shada = ''
vim.o.shadafile = ''
vim.o.mouse = 'a'			-- support mouse in all modes so it won't copy line numbers
vim.o.fileformats = 'unix,dos,mac'
vim.o.backspace = 'indent,eol,start'	-- let backspace delete over line breaks and tabs
vim.o.whichwrap = 'b,s,<,>,h,l,~,[,]'	-- let h and l keys to wrap when used at beginning or end of lines
vim.o.listchars = 'tab:> ,trail:-,nbsp:+,eol:$'
vim.o.pastetoggle = '<Leader>p'		-- paste without re-indent

--[[ KEYMAPS ]]--

-- Indent
d.nnoremap('<Leader>t8', ':lua d.indent("tab", 8)<Cr>')
d.nnoremap('<Leader>t4', ':lua d.indent("tab", 4)<Cr>')
d.nnoremap('<Leader>s8', ':lua d.indent("space", 8)<Cr>')
d.nnoremap('<Leader>s4', ':lua d.indent("space", 4)<Cr>')

-- Replace <Esc>
d.inoremap('jk', '<Esc>')
d.vnoremap('q', '<Esc>')
d.vnoremap('v', '<Esc>')
d.cnoremap('jk', '<C-c>')

-- Reselect visual blox after indent/outdent
d.vnoremap('<', '<gv')
d.vnoremap('>', '>gv')

-- Goto next displayed line instead of physical line when long line is wrapped
d.nnoremap('j', 'gj')
d.nnoremap('k', 'gk')

-- Switching buffers
d.nnoremap('<C-n>', ':bnext<Cr>')
d.nnoremap('<C-p>', ':bprev<Cr>')

-- Return cursor to original position after .
d.nnoremap('.', '.`[')

-- Toggle listchars
d.nnoremap('<Leader>l', ':lua vim.o.list = not vim.o.list<Cr>')

-- Clear search highlight
d.nnoremap('<Leader><Space>', ':nohlsearch<Cr>')

-- Search in case-sensitive by default
d.nnoremap_ns('/', '/\\c', { silent = false })
d.vnoremap_ns('/', '/\\c', { silent = false })
d.nnoremap_ns('?', '?\\c', { silent = false })
d.vnoremap_ns('?', '?\\c', { silent = false })

-- Search with yanked text
d.vnoremap('//', 'y/<C-r>"<Cr>')


-- Macro
d.nnoremap('<Space>', '@q')

-- Use real tab in makefiles
vim.api.nvim_command('autocmd FileType make setlocal noexpandtab')

-- Disable built plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1

--[[ LUALINE ]]--
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'auto',
		--component_separators = {'', ''},
		--section_separators = {'', ''},
		component_separators = {},
		section_separators = {},
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {'fileformat'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {'fileformat'},
		lualine_z = {'location'}
	},
	tabline = {},
	extensions = {}
}

--[[ BUFTABLINE ]]--
vim.g.buftabline_show = 1
vim.g.buftabline_numbers = 1
vim.g.buftabline_indicators = true
vim.g.buftabline_separators = false

--[[ GITSIGNS ]]--
require('gitsigns').setup()

--[[ TELESCOPE ]]--
require('telescope').setup()

--[[ LSPFUZZY ]]--
require('lspfuzzy').setup{}

--[[ LSP ]]--
local on_attach = function(client, bufnr)
	require('completion').on_attach()

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end
end

--[[ CLANGD ]]--
require('lspconfig').clangd.setup {
	on_attach = on_attach
}

--[[ TREESITTER ]]--
require('nvim-treesitter.configs').setup {}

--[[ NVIM-LSPUTILS ]]--
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

--[[ LSP_SIGNATURE ]]--
require "lsp_signature".setup()

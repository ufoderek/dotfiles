local function snoremap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function lazy_indent(indent, width)
	vim.opt.shiftwidth = width
	vim.opt.tabstop = width
	if indent == 'tab' then
		vim.opt.expandtab = false
		vim.opt.softtabstop = 0
	else
		vim.opt.expandtab = true
		vim.opt.softtabstop = width
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
end)

--[[ VARIALBES ]]--
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--[[ SOLARIZED8 ]]--
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.solarized_extra_hi_groups = 1
vim.cmd('colorscheme solarized8_flat')

--[[ OPTIONS ]]--
vim.opt.swapfile = false
vim.opt.autochdir = true			-- set working dir to current file
vim.opt.showmatch = true			-- show matching brackets
vim.opt.cursorline = true			-- highlight current line
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.colorcolumn = {'80', '100'}		-- Linux standard
vim.opt.sidescroll = 5				-- speedup horizontal scroll
vim.opt.timeoutlen = 500
vim.opt.shada = ''
vim.opt.shadafile = ''
vim.opt.mouse = 'a'				-- support mouse in all modes so it won't copy line numbers
vim.opt.fileformats = {'unix', 'dos', 'mac'}
vim.opt.backspace = {'indent', 'eol', 'start'}	-- let backspace delete over line breaks and tabs
vim.opt.whichwrap = 'b,s,<,>,h,l,~,[,]'		-- let h and l keys to wrap when used at beginning or end of lines
vim.opt.listchars = 'tab:> ,trail:-,nbsp:+,eol:$'
vim.opt.pastetoggle = '<Leader>p'		-- paste without re-indent

--[[ KEYMAPS ]]--

-- Indent
snoremap('n', '<Leader>t8', ':lua lazy_indent("tab", 8)<Cr>')
snoremap('n', '<Leader>t4', ':lua lazy_indent("tab", 4)<Cr>')
snoremap('n', '<Leader>s8', ':lua lazy_indent("space", 8)<Cr>')
snoremap('n', '<Leader>s4', ':lua lazy_indent("space", 4)<Cr>')

-- Replace <Esc>
snoremap('i', 'jk', '<Esc>')
snoremap('v', 'q', '<Esc>')
snoremap('v', 'v', '<Esc>')
snoremap('c', 'jk', '<C-c>')

-- Reselect visual blox after indent/outdent
snoremap('v', '<', '<gv')
snoremap('v', '>', '>gv')

-- Goto next displayed line instead of physical line when long line is wrapped
snoremap('n', 'j', 'gj')
snoremap('n', 'k', 'gk')

-- Switching buffers
snoremap('n', '<C-n>', ':bnext<Cr>')
snoremap('n', '<C-p>', ':bprev<Cr>')

-- Return cursor to original position after .
snoremap('n', '.', '.`[')

-- Toggle listchars
snoremap('n', '<Leader>l', ':lua vim.opt.list = not vim.opt.list<Cr>')

-- Clear search highlight
snoremap('n', '<Leader><Space>', ':nohlsearch<Cr>')

-- Search in case-sensitive by default
snoremap('n', '/', '/\\c', { silent = false })
snoremap('s', '/', '/\\c', { silent = false })
snoremap('n', '?', '?\\c', { silent = false })
snoremap('s', '?', '?\\c', { silent = false })

-- Search with yanked text
snoremap('v', '//', 'y/<C-r>"<Cr>')


-- Macro
snoremap('n', '<Space>', '@q')

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

--[[ BUFTABLINE ]]--
vim.g.buftabline_show = 1
vim.g.buftabline_numbers = 1
vim.g.buftabline_indicators = true
vim.g.buftabline_separators = false

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

--[[ GITSIGNS ]]--
require('gitsigns').setup()

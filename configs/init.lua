local d = {}

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
	use 'gruvbox-community/gruvbox'
	use 'christoomey/vim-tmux-navigator'
	--use 'fholgado/minibufexpl.vim'
	use 'akinsho/bufferline.nvim'
	use {
		'hoob3rt/lualine.nvim'
	}
	use 'karb94/neoscroll.nvim'
end)
-- vim.cmd('autocmd BufWritePost plugins.lua source <afile> | PackerCompile')

--[[ VARIALBES ]]--
vim.g.mapleader = ','
vim.g.maplocalleader = ','

--[[ COLOR ]]--
vim.g.termguicolor = true
vim.cmd('colorscheme gruvbox')

--[[ OPTIONS ]]--
vim.o.swapfile = false
vim.o.autochdir = true			-- set working dir to current file
vim.o.showmatch = true			-- show matching brackets
vim.o.cursorline = true			-- highlight current line
vim.o.splitbelow = true
vim.o.splitright = true
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
require'lualine'.setup {
	options = {
		icons_enabled = false,
		theme = 'gruvbox',
		component_separators = {'', ''},
		section_separators = {'', ''},
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

--[[ BUFFERLINE ]]--
vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    numbers = "ordinal",
    number_style = "none",
    close_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    right_mouse_command = "",
    middle_mouse_command = "bdelete! %d",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = false,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    sort_by = 'id'
  }
}

--[[ NEOSCROLL ]]--
require('neoscroll').setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
		    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
	hide_cursor = true,          -- Hide cursor while scrolling
	stop_eof = true,             -- Stop at <EOF> when scrolling downwards
	use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil,       -- Default easing function
	pre_hook = nil,              -- Function to run before the scrolling animation starts
	post_hook = nil,             -- Function to run after the scrolling animation ends
})

-- globals
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- options
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

-- disable built-in plugins
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


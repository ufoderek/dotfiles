local snoremap = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	return
end

function _G.lazy_indent(indent, width)
	vim.opt.shiftwidth = width
	vim.opt.tabstop = width
	if indent == 'tab' then
		vim.opt.expandtab = false
		vim.opt.softtabstop = 0
	else
		vim.opt.expandtab = true
		vim.opt.softtabstop = width
	end
	return
end

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

-- Buffer navigation
snoremap('n', '<Leader>b', ':ls<Cr>:b<Space>', { silent = false })
snoremap('n', '<Leader>n', ':bnext<Cr>')
snoremap('n', '<Leader>p', ':bprevious<Cr>')
snoremap('n', '<Leader>d', ':bdelete<Cr>')
snoremap('n', '<Leader>u', '<C-^>') -- toggle between last two buffers

-- Tab navigation
snoremap('n', '<Leader>1', '1gt')
snoremap('n', '<Leader>2', '2gt')
snoremap('n', '<Leader>3', '3gt')
snoremap('n', '<Leader>4', '4gt')
snoremap('n', '<Leader>5', '5gt')
snoremap('n', '<Leader>6', '6gt')
snoremap('n', '<Leader>7', '7gt')
snoremap('n', '<Leader>8', '8gt')
snoremap('n', '<Leader>9', '9gt')
snoremap('n', '<Leader>0', '10gt')
snoremap('n', 'tl', ':tabnext<Cr>')
snoremap('n', 'th', ':tabprev<Cr>')
snoremap('n', 'tj', ':tabfirst<Cr>')
snoremap('n', 'tk', ':tablast<Cr>')
snoremap('n', 'tt', ':tabedit<Space>', { silent = false })
snoremap('n', 'tm', ':tabmove<Space>', { silent = false })
snoremap('n', 'td', ':tabclose<Cr>')
snoremap('n', 'tu', 'g<Tab>') -- toggle between last two tabs
snoremap('n', '<MiddleMouse>', ':tabclose<Cr>')

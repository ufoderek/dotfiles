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

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.solarized_extra_hi_groups = 1
vim.cmd [[
try
  colorscheme solarized8_flat
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]

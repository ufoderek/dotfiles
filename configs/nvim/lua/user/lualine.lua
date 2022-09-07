require('lualine').setup({
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
})

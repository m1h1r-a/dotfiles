return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { { "filename", path = 0 }, "branch" },
				lualine_c = { { "filename", path = 3, shorting_target = 40 } },
				lualine_x = { "diff" },
				lualine_y = { "filetype" },
				lualine_z = { { "searchcount", separator = { right = "" }, left_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			-- extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
		}
	end,
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
	  icons_enabled = true,
	  globalstatus = true,
        },
	sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
	  lualine_c = {'filename'},
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn", "info", "hint" },
            },
            "encoding",
            "fileformat",
          },
          lualine_y = { "filetype" },
          lualine_z = { "progress", "location" },
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}


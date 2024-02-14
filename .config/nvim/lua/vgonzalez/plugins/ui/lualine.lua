local function get_vim_mode()
  local icon = {
    n = "",
    i = "",
    c = "",
    V = "",
    v = "",
    R = "",
    r = "",
    t = "",
  }
  local vim_mode = vim.fn.mode()
  local ic = icon[vim_mode]
  if ic == nil then
    ic = ""
  end
  return ic
end

local function get_last_buffer_filename()
  local this_buffer = vim.fn.bufname()
  local last_buffer = vim.fn.bufname("#")
  if last_buffer == "" or last_buffer == this_buffer then
    return "No previous buffer"
  else
    -- just the name
    return vim.fn.fnamemodify(last_buffer, ":t")
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
  },
  opts = {
    options = {
      theme = "auto",
      component_separators = "",
      section_separators = { "", "" },
      -- component_separators = '',
      -- section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { "Dashboard", "TelescopePrompt" },
        winbar = { "Dashboard", "TelescopePrompt", "neo-tree", "toggleterm" },
      },

      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          "mode", --[[ separator = { left = '', right = '' } ]]
        },
      },
      lualine_b = {
        -- { "datetime", style = "%d %a, %H:%M" },
        {
          "branch",
          icon = "",
        },
        -- {
        --   "filename",
        --   symbols = {
        --     modified = "",
        --     readonly = "",
        --     unnamed = "",
        --     newfile = "",
        --   },
        --   path = 1,
        -- },
      },
      lualine_c = {
        {
          "diagnostics",

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { "nvim_lsp" },

          -- Displays diagnostics for the defined severity types
          sections = { "error", "warn", "info", "hint" },

          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = "DiagnosticError", -- Changes diagnostics' error color.
            warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
            info = "DiagnosticInfo", -- Changes diagnostics' info color.
            hint = "DiagnosticHint", -- Changes diagnostics' hint color.
          },
          symbols = { error = " ", warn = " ", info = " ", hint = "󰘥 " },
          colored = true,      -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false, -- Show diagnostics even if there are none.
        },
      },
      lualine_x = { "g:metals_status" },
      lualine_y = {
        -- {
        --   "filename",
        --   symbols = {
        --     modified = "",
        --     readonly = "",
        --     unnamed = "",
        --     newfile = "",
        --   },
        -- },
        "progress",
      },
      lualine_z = {
        {
          "location", --[[ , separator = { right = '', left = ''} ]]
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      -- lualine_a = {{ 'fileformat', separator = { left = '', right = ''} }},
      lualine_a = {
        { get_vim_mode },
      },
      lualine_b = {
        -- { "datetime", style = "%d %a, %H:%M" },
        {
          "filename",
          symbols = {
            modified = "",
            readonly = "",
            unnamed = "",
            newfile = "",
          },
          path = 1,
        },
      },
      lualine_c = { get_last_buffer_filename },
      lualine_x = {},
      lualine_y = { "filetype" },
      lualine_z = { "fileformat" },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          symbols = {
            modified = "",
            readonly = "",
            unnamed = "",
            newfile = "",
          },
          path = 1,
        },
      },
      lualine_x = { "filetype" },
      lualine_y = {},
      lualine_z = {},
    },
    -- inactive_winbar = {
    --   -- lualine_a = {{ 'fileformat', separator = { left = '', right = ''} }},
    --   lualine_b = {
    --     {
    --       "filename",
    --       symbols = {
    --         modified = "",
    --         readonly = "",
    --         unnamed = "",
    --         newfile = "",
    --       },
    --     },
    --   },
    --   -- lualine_x = { "fileformat" },
    -- },
    extensions = {
      "neo-tree",
      "lazy",
      "toggleterm",
    },
  },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'SmiteshP/nvim-navic',
  },
  opts = {
    options = {
      theme = "auto",
      component_separators = '|',
      section_separators = { '', '' },
      -- component_separators = '',
      -- section_separators = { left = '', right = '' },
      disabled_filetypes = { 'neo-tree', 'toggleterm', 'Dashboard', 'TelescopePrompt' },
    },
    sections = {
      lualine_a = {
        { 'mode', --[[ separator = { left = '', right = '' } ]] },
      },
      lualine_b = { { 'datetime', style = '%d %a, %H:%M' }, 'branch' },
      lualine_c = {},
      lualine_x = { 'g:metals_status' },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location' --[[ , separator = { right = '', left = ''} ]] },
      },
    },
    inactive_sections = {
      -- lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'filetype' },
      lualine_z = {},
    },
    winbar = {
      -- lualine_a = {{ 'fileformat', separator = { left = '', right = ''} }},
      lualine_b = {
        {
          'filename',
          symbols = {
            modified = '',
            readonly = '',
            unnamed = '',
            newfile = ''
          }
        }

      },
      lualine_c = {
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
         sources = { 'nvim_lsp' },

          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },

          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
          },
          symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰘥 ' },
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        },
        { 'navic', color_correction = 'dynamic' },
      },
      lualine_x = { 'fileformat' },
    },
    inactive_winbar = {
      -- lualine_a = {{ 'fileformat', separator = { left = '', right = ''} }},
      lualine_b = {
        {
          'filename',
          symbols = {
            modified = '',
            readonly = '',
            unnamed = '',
            newfile = ''
          }
        }

      },
      lualine_x = { 'fileformat' },
    },
    extensions = {
      'neo-tree',
      'lazy',
      'toggleterm'
    }
  }
}

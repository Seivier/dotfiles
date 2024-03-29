local M = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}


M.config = function()
  require('dashboard').setup {
    theme = 'hyper',
    disable_move = true,
    change_to_vsc_root = true,
    config = {
      disable_move = true,
      header = {
        "====================================================================================================",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡃⠠⠁⢠⠁⠀⡜⠀⠀⠀⠌⢀⣐⢁⡈⠀⠀⠀⠀⠈⠪⣆⠀⠀⡘⡀⢢⠀⢀⠀⠀⠀⠱⠀⠀⠀⠀⡇⠀⠀⠀⠰⠀⢹⣿⢿⣻⣾⣟⣷⣿⠆",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⡇⠀⠘⠀⠰⠀⠀⠀⡌⠈⡐⠅⠀⠈⡀⠀⠀⠀⠀⠀⠈⠁⠀⡱⠀⢀⢁⠀⠁⠐⢀⠀⡃⠀⠀⠀⢰⠀⠀⠀⠈⡃⢸⣿⡿⣿⣽⣾⣟⣿⠆",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠂⠀⠀⠀⡞⠀⠀⠰⠁⠔⠀⠀⠀⠀⠱⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠢⠀⠀⠀⠀⡇⠀⠀⠀⢨⠀⠀⠀⠀⠃⢸⣿⣟⣿⣽⣷⣿⣿⠇",
        "⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠘⣆⠀⢸⠠⡇⠀⠀⣇⠈⣀⣠⣄⣀⡂⢀⠡⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⣃⠀⠀⠀⡗⠀⠀⠀⡼⠀⠀⠀⠀⡇⢸⣿⣻⣯⣿⣾⣿⡿⠀",
        "⠀⠀⠀⠀⠀⡮⠃⠀⡒⠢⢐⠄⠀⠀⡙⡄⠀⢎⡇⠀⠀⠙⣿⠟⠉⡥⠿⣿⣦⡀⠐⠄⠀⠀⠀⠀⠀⠃⠉⠀⠀⠀⠀⠑⠀⠀⠃⡘⠀⢠⠃⠀⠀⠀⢠⠀⣼⣿⣿⣿⣿⣿⣿⠁⠀",
        "⠀⠀⠀⠀⢀⠤⠛⠉⠃⠀⠈⠒⠡⠖⢡⢦⠀⠀⢇⠀⠀⡇⠈⠂⢠⣦⣰⠚⣿⣧⠀⠈⠠⠀⠳⠄⡀⠆⠀⣀⣀⣀⡀⠀⠈⠞⠀⠇⠀⡔⠂⡄⠢⢌⡋⣴⣿⣿⣿⣿⣿⣿⠃⠀⠀",
        "⠀⢀⠔⠈⢀⠠⠤⠀⠀⠤⢀⠀⢀⡠⢂⢎⠇⢐⡐⡀⠀⢞⠀⠀⠘⣿⢻⣈⣡⡏⠀⠀⠀⠀⠑⠱⣌⠸⠚⠛⠛⠛⠻⣷⣷⠞⠀⠡⠘⢒⠡⢌⣑⠞⣴⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀",
        "⠠⢃⡴⠛⠋⠉⠉⣉⠐⠩⠶⠀⠉⠶⠿⠅⠚⠉⢠⠈⠠⡈⠣⠀⠀⠈⠃⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠄⠘⡀⠀⠐⡦⢊⣾⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀",
        "⡇⠞⠁⢀⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠔⠁⣀⠔⡨⢣⠉⠀⠀⠀⠀⠀⠀⢠⡞⠉⠉⠁⢡⠀⠀⠀⠀⠀⠀⠀⢈⠀⠀⠈⠀⠠⣀⣴⣾⣿⠿⠿⠿⠯⠥⠤⠄⠀⡀⠀⠀⠀",
        "⠳⡀⠠⠁⠀⠀⣀⡴⠖⡺⠛⣉⠍⠂⠀⠀⠀⠈⠁⠈⠈⠀⠀⠣⢀⠀⠀⠀⠀⠀⠀⠁⠀⠀⢀⠔⠀⠀⠀⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠉⠉⠁⠄⠀⠄⣀⣀⢀⠀⠀⠀⠀⠁⠢⡀",
        "⠈⠲⠃⠀⠔⣽⠋⠀⠐⡃⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣠⠬⡐⠀⠠⠄⣀⠀⠀⠉⠀⠀⢀⣀⢀⡀⠤⢥⣶⣾⡅⠂⠠⠤⠤⠤⠐⠐⠂⢢⠀⠈⡆⠀⠀⢣⠀⠀⠀⠀⠐",
        "⠀⢠⡀⣼⠘⡇⠀⠀⠀⠙⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣳⣹⠁⠲⣔⠘⣦⢞⣿⡽⢽⡏⠋⣷⢑⣄⡀⠻⣿⣿⠻⡀⠀⠀⠀⢠⣖⠀⠀⡰⠀⢠⠗⠂⢀⠔⠀⡰⠂⠀⡐",
        "====================================================================================================",
      },
      shortcut = {
        {
          icon = '🔎 ',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          icon = '📁 ',
          desc = 'File tree',
          group = 'DiagnosticHint',
          action = 'Neotree reveal position=float',
          key = 'e',
        },
        {
          icon = '🔌 ',
          desc = 'Plugins',
          group = 'Number',
          action = 'Lazy',
          key = 'p',
        },
        {
          icon = '🐙 ',
          desc = 'Git',
          group = 'FloatTitle',
          action = 'LazyGit',
          key = 'g',
        },
        {
          icon = "💻 ",
          desc = "Sessions",
          group = "@property",
          action = "Telescope tmux sessions",
          key = "s"
        },
        {
          icon = "🎣 ",
          desc = "Harpoon",
          group = "WarningMsg",
          action = function() require('harpoon.ui').toggle_quick_menu() end,
          key = "h"
        },
        -- {
        --   icon = " ",
        --   desc = "Terminal",
        --   group = "WarningMsg",
        --   action = "ToggleTerm direction=float",
        --   key = "t"
        -- },
        {
          icon = "❌ ",
          desc = "Quit",
          group = "ErrorMsg",
          action = "quit",
          key = "q"
        }
      },
      project = {
        enable = true,
        limit = 5,
      },
      mru = {
        limit = 5,
      }
    },
  }
end

return M

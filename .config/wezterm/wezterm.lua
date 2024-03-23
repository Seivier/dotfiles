local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'rose-pine'
-- config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "1.5cell",
  bottom = "0.5cell",
}

return config

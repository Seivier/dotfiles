local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'rose-pine'
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.macos_window_background_blur = 20
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight= "Medium"})
config.font_size = 11
config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "NONE"
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.5cell",
  bottom = "0.5cell",
}

return config

local wezterm = require 'wezterm'

local config = {}

config.front_end = 'WebGpu'
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback {
    'CommitMono Nerd Font',
    'Hack',
    'Hack Nerd Font',
    'Symbols Nerd Font',
    'Noto Color Emoji'
}
config.font_size = 14
config.colors = {
    foreground = '#00ff00',
    background = '#1f1f1f',
    cursor_bg = 'white'
}
config.default_cursor_style = 'SteadyBar'
config.window_background_opacity = 0.9
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

return config

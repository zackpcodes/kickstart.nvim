local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
config.font_size = 16
config.window_frame = {
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 14,
}
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.color_scheme = 'One Dark (Gogh)'
local scheme_def = wezterm.color.get_builtin_schemes()[config.color_scheme]

config.color_scheme = config.color_scheme
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    }
  }
}

local function basename(s)
  return string.gsub(s, '(.-)([^/]+)/?$', '%2')
end
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local cwd = pane.current_working_dir
  return {
    {Text="  " .. basename(cwd.path) .. "  "},
  }
end)
return config

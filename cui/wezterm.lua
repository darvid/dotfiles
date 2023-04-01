local wezterm = require("wezterm")

local function font_with_fallback(name, params)
  local names = { name, "Apple Color Emoji" }
  return wezterm.font_with_fallback(names, params)
end

local font_name = "MonoLisa"

return {
  automatically_reload_config = true,
  bold_brightens_ansi_colors = true,
  color_scheme = "Dracula Pro - Van Helsing",
  default_cursor_style = "BlinkingBlock",
  default_prog = {'wsl.exe', '~'},
  dpi = 96.0,
  enable_tab_bar = true,
  font = font_with_fallback(font_name),font_rules = {
    {
      italic = true,
      font = font_with_fallback(font_name, { italic = true }),
    },
    {
      italic = false,
      font = font_with_fallback(font_name, { bold = false }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback(font_name, { bold = true }),
    },
  },
  font_size = 12,
  front_end = "OpenGL",
  hide_tab_bar_if_only_one_tab = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  line_height = 1.0,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = true,
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.9,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
}


local wezterm = require 'wezterm';

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#434C5E"
  local foreground = "#808080"

  if tab.is_active then
    background = "#434C5E"
    foreground = "#f0f0f0"
  elseif hover then
    background = "#434C5E"
    foreground = "#909090"
  end

  -- ensure that the titles fit in the available space,
  -- and that we have room for the edges.
  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width-2) .. " "

  return {
		{Background={Color=background}},
    {Foreground={Color=foreground}},
    {Text=title},
  }
end)

return {
  use_ime = true,
  font = wezterm.font("HackGenNerd", {weight="Regular"}),
  font_size = 15.0,
  freetype_load_flags = "NO_AUTOHINT",
  line_height = 1.1,
  color_scheme = "nord",
  hide_tab_bar_if_only_one_tab = true,
  window_frame = {
    font = wezterm.font({family="HackGenNerd", weight="Bold"}),
    font_size = 15.0,
    active_titlebar_bg = "#434C5E",
    inactive_titlebar_bg = "#434C5E",
  },
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 1.0,
  -- window_background_image_hsb = {
  --   brightness = 0.5,
  --   hue = 1.0,
  --   saturation = 1.0,
  -- },
  window_background_gradient = {
    orientation = {
      Radial={
        cx = 0.65,
        cy = 0.35,
        radius = 1.0,
      },
    },
    colors = {
      "#434343",
      "#000000",
    },
    -- interpolation = "Linear",
    blend = "Hsv",
    noise = 64,
  },
  initial_cols = 140,
  initial_rows = 36,
  tab_bar_at_bottom = true,
  keys = {
    {key="w", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=true}}},
    {key="w", mods="SHIFT|CMD", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    {key="|", mods="SHIFT|CMD", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="\"", mods="SHIFT|CMD", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  }
}

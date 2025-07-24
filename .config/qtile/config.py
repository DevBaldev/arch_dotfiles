from keybinds import AllKeys
from themes import Catppuccin
import os

os.system("/usr/bin/nm-applet &")

all_keys = AllKeys()
keys: list = all_keys.keybindings()
mouse: list = all_keys.mouse_keybindings()

theme = Catppuccin()

layouts: list = theme.layouts

widget_defaults: dict = theme.widget_defaults
extension_defaults: dict = widget_defaults.copy()

screens: list = theme.screen

floating_layout = theme.floating_layout

cursor_warp = False
auto_minimize = True
auto_fullscreen = True
floats_kept_above = True
bring_front_click = False
follow_mouse_focus = True
reconfigure_screens = True
focus_on_window_activation = "smart"

wl_input_rules = None
wl_xcursor_size = 22
wl_xcursor_theme = "Bibata-Modern-Ice"

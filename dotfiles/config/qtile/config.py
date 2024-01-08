from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import hooks
from groups import groups
from keys import keys, mouse
from layouts import layouts, floating_layout
from topbar import screens, widget_defaults


# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# General Configuration
auto_fullscreen = True
bring_front_click = "floating_only"
cursor_warp = False   # warp cursor to center of focused window on focus change
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
floats_kept_above = True
follow_mouse_focus = False
reconfigure_screens = True
auto_minimize = True
focus_on_window_activation = "smart"

import os

from libqtile import bar, widget
from libqtile.config import Screen

from dateutil.tz import *

from colors import color_schema

import widgets

from utils import (
    DEFAULT_FONT,
    ICONS_DIR,
    WALLPAPER_PATH,
    KEYBOARD_LAYOUTS,
    BRIGHTNESS_DIR,
    SET_BRIGHTNESS_SHELL_CMD,
    GET_SPEAKERS_VOLUME_SHELL_CMD,
    RAISE_SPEAKERS_VOLUME_SHELL_CMD,
    LOWER_SPEAKERS_VOLUME_SHELL_CMD,
    ARE_SPEAKERS_MUTED_SHELL_CMD,
    TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
    GET_MICROPHONE_VOLUME_SHELL_CMD,
    RAISE_MICROPHONE_VOLUME_SHELL_CMD,
    LOWER_MICROPHONE_VOLUME_SHELL_CMD,
    IS_MICROPHONE_MUTED_SHELL_CMD,
    TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
    BLUETOOTH_DEVICE_HCI_PATH
)

widget_defaults = dict(
    font=DEFAULT_FONT,
    background=color_schema['bg'],
    foreground=color_schema['fg'],
    fontsize=14,
    padding=6,
)
extension_defaults = widget_defaults.copy()

separator = widget.Sep(size_percent=50, foreground=color_schema['fg3'])

screens = [
    Screen(
        wallpaper=WALLPAPER_PATH,
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.GroupBox(
                    disable_drag=True,
                    use_mouse_wheel=False,
                    active=color_schema['fg'],
                    inactive=color_schema['dark-gray'],
                    highlight_method='text',
                    this_current_screen_border=color_schema['dark-yellow'],
                    urgent_alert_method='text',
                    urgent_text=color_schema['dark-red'],
                    fontsize=18
                ),
                separator,
                widget.CurrentLayout(padding=0),
                widget.Spacer(),
                widget.Clock(format='%d %b %H:%M:%S', timezone=gettz("America/Sao_Paulo")),
                widget.Spacer(),
                widgets.Bluetooth(
                    hci=BLUETOOTH_DEVICE_HCI_PATH,
                    fmt="{}",
                    fontsize=16
                ),
                widgets.NetworkManager(
                    name='network_manager',
                    icons={
                        '802-3-ethernet': '󰈀',
                        '802-11-wireless': ' ',    
                    },
                    format_string='{icon}',
                    no_connection_format_string='{icon} {network_name} (no connection)',
                    update_interval=5,
                ),
                separator,
                widgets.Volume(
                    name='speakers_volume',
                    get_volume_shell_cmd=GET_SPEAKERS_VOLUME_SHELL_CMD,
                    raise_volume_shell_cmd=RAISE_SPEAKERS_VOLUME_SHELL_CMD,
                    lower_volume_shell_cmd=LOWER_SPEAKERS_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=ARE_SPEAKERS_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
                    icons = {
                        'muted': '󰖁',
                        'low': '',
                        'medium': '󰕾',
                        'high': ''
                    },
                    update_interval=1,
                ),
                widgets.Volume(
                    name='microphone_volume',
                    get_volume_shell_cmd=GET_MICROPHONE_VOLUME_SHELL_CMD,
                    raise_volume_shell_cmd=RAISE_MICROPHONE_VOLUME_SHELL_CMD,
                    lower_volume_shell_cmd=LOWER_MICROPHONE_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=IS_MICROPHONE_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
                    icons = {
                        'muted': '󰍭',
                        'low': '󰍬',
                        'medium': '󰍬',
                        'high': '󰍬'
                    },
                    update_interval=1,
                ),
                separator,
                widget.KeyboardLayout(
                    configured_keyboards=KEYBOARD_LAYOUTS,
                    fmt='󰌌 {}',
                ),
                separator,
                widget.Systray(),
            ],
            30,
            margin=[0, 0, 0, 0],
        ),
    ),
]
from pathlib import Path

MOD_KEY = 'mod4'
TERMINAL = 'alacritty'
FILE_EXPLORER = 'thunar'
DEFAULT_FONT = 'JetBrainsMono Nerd Font'

AUTOSTART_APPS = [
    "xset r rate 300 25",
    "sh ~/.screenlayout/monitor.sh",
    "feh --bg-center --randomize ~/wallpapers/*",
    "/usr/libexec/polkit-mate-authentication-agent-1 &",
    "killall -qw dunst; dunst &",
    "killall -qw blueman-applet; blueman-applet &",
    "killall -qw udiskie; udiskie &",
    "killall -qw mate-screensaver; mate-screensaver &",
    "/usr/share/pje-office/pjeOffice.sh &",
]

RUN_APP_LAUNCHER_SHELL_CMD = 'rofi -show drun -config ~/.config/rofi/ultrarofi.rasi'

RUN_POWER_MENU = "rofi -show p -modi p:'~/.local/bin/rofi-power-menu' -theme ~/.config/rofi/ultratheme.rasi -theme-str 'window {width: 20em; height: 15em;} listview {lines: 6;}'"

BRIGHTNESS_DIR = 'amdgpu_bl0'
"""
Directory name in /sys/class/backlight which provides
backlight control interface
"""

LOCK_SCREEN_CMD = 'mate-screensaver-command -l'

SET_BRIGHTNESS_SHELL_CMD = 'brightnessctl set {}%'
"""
Shell command template to set screen brightness
"""

ICONS_DIR = str(Path.home() / '.config' / 'qtile' / 'icons')
WALLPAPER_PATH = str(Path.home() / '.config' / 'wallpapers' / 'spaceman.jpg')

TAKE_SCREENSHOT_SHELL_CMD = '''
    maim -o -s \
        | tee $(xdg-user-dir PICTURES)/screenshot_$(date +%F_%H.%M.%S).png \
        | xclip -selection clipboard -t image/png
'''
"""
Shell command to take a screenshot, save it to images directory and copy
it to the clipboard
"""

LOCK_X_SESSION_SHELL_CMD = 'loginctl lock-session'
"""
Shell command to lock X session
"""

KEYBOARD_LAYOUTS = ['us intl', 'pt br']
"""
List of keyboard layouts which should be available in system
"""

GET_SPEAKERS_VOLUME_SHELL_CMD = '''
    pactl get-sink-volume @DEFAULT_SINK@ \
    | grep -i Volume \
    | awk '{print $5}' \
    | sed 's/%//'
'''
RAISE_SPEAKERS_VOLUME_SHELL_CMD = '''
    pactl set-sink-mute @DEFAULT_SINK@ 0 && \
    pactl set-sink-volume @DEFAULT_SINK@ +5%
'''
LOWER_SPEAKERS_VOLUME_SHELL_CMD = 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
ARE_SPEAKERS_MUTED_SHELL_CMD = '''
    pactl get-sink-mute @DEFAULT_SINK@ \
        | grep -q 'no' \
        && echo 0 \
        || echo 1
'''
TOGGLE_SPEAKERS_MUTE_SHELL_CMD = 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

GET_MICROPHONE_VOLUME_SHELL_CMD = '''
    pactl get-source-volume @DEFAULT_SOURCE@ \
    | grep -i Volume \
    | awk '{print $5}' \
    | sed 's/%//'
'''
RAISE_MICROPHONE_VOLUME_SHELL_CMD = '''
    pactl set-source-mute @DEFAULT_SOURCE@ 0 && \
    pactl set-source-volume @DEFAULT_SOURCE@ +5%
'''
LOWER_MICROPHONE_VOLUME_SHELL_CMD = 'pactl set-source-volume @DEFAULT_SOURCE@ -5%'  # noqa: E501
IS_MICROPHONE_MUTED_SHELL_CMD = '''
    pactl get-source-mute @DEFAULT_SOURCE@ \
        | grep -q 'no' \
        && echo 0 \
        || echo 1
'''
TOGGLE_MICROPHONE_MUTE_SHELL_CMD = '''
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
'''

BLUETOOTH_DEVICE_HCI_PATH = '/dev_FC_E1_E6_13_E2_A6'

MEDIA_PLAY = 'playerctl play'
MEDIA_PAUSE = 'playerctl pause'
MEDIA_TOGGLE_PLAY = 'playerctl play-pause'
MEDIA_STOP = 'playerctl stop'
MEDIA_NEXT = 'playerctl next'
MEDIA_PREV = 'playerctl previous'

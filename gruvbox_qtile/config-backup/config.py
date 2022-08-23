#               *Style-1) change_style   ;;
#				*Style-2) change_style   ;;
#				*Style-3) change_style   ;;
#				*Style-4) change_style   ;;
#				*Style-5) change_style   ;;
#				*Style-6) change_style   ;;
#				*Style-7) change_style   ;;
#				*Style-8) change_style   ;;
#				*Style-9) change_style   ;;
#				*Style-10) change_style   ;;
#				*Style-11) change_style   ;;
#				*Style-12) change_style   ;;

import os
import re
import socket
import subprocess
import psutil

from time import time
from pathlib import Path

from typing import List  # noqa: F401zzz

from libqtile import bar, layout, widget, hook
from libqtile.config import (KeyChord,Key,Screen,Group,Drag,Click,ScratchPad,DropDown,Match,)
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.command import lazy
from libqtile import qtile
from custom.bsp import Bsp as CustomBsp

mod = "mod4"
browser = "google-chrome-beta"
terminal = guess_terminal()
flameshot_full_screen = "flameshot screen -c"
flameshot_gui = "flameshot gui"
flameshot_save_path = "flameshot screen -p /home/erlonbie/Pictures/"
# flameshot_save_path = "scrot /home/erlonbie/Pictures/"
meu_step = 10000


@hook.subscribe.startup
def dbus_register():
    id = os.environ.get('DESKTOP_AUTOSTART_ID')
    if not id:
        return
    subprocess.Popen(['dbus-send',
                      '--session',
                      '--print-reply',
                      '--dest=org.gnome.SessionManager',
                      '/org/gnome/SessionManager',
                      'org.gnome.SessionManager.RegisterClient',
                      'string:qtile',
                      'string:' + id])

def backlight(action):
    def f(qtile):
        brightness = int(subprocess.run(['xbacklight', '-get'], stdout=subprocess.PIPE).stdout)
        if brightness != 1 or action != 'dec':
            if (brightness > 49 and action == 'dec') \
                                or (brightness > 39 and action == 'inc'):
                subprocess.run(['xbacklight', f'-{action}', '10',
                                '-fps', '10'])
            else:
                subprocess.run(['xbacklight', f'-{action}', '1'])
    return f

def screenshot(save=True, copy=True):
    def f(qtile):
        path = Path.home() / 'Pictures'
        path /= f'screenshot_{str(int(time() * 100))}.png'
        shot = subprocess.run(['maim'], stdout=subprocess.PIPE)

        if save:
            with open(path, 'wb') as sc:
                sc.write(shot.stdout)

        if copy:
            subprocess.run(['xclip', '-selection', 'clipboard', '-t',
                            'image/png'], input=shot.stdout)
    return f

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Brightness
    # Key([], 'F7', lazy.spawn('xset dpms force off')),
    Key([], 'XF86MonBrightnessUp',   lazy.spawn("xbacklight -inc 10")),
    Key([], 'XF86MonBrightnessDown',   lazy.spawn("xbacklight -dec 10")),
    
    # Screenshots
    # Key([mod, "shift"], 'Print', lazy.function(screenshot(False, True))),
    Key([mod, "shift"], 'Print', lazy.spawn(flameshot_gui)),
    Key([mod], "Print", lazy.spawn(flameshot_full_screen)),
    # Key([], "Print", lazy.spawn("scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")),
    Key([], "Print", lazy.spawn(flameshot_save_path)),
    # Key([], 'Print', lazy.function(screenshot(True, True))),
    # Key([mod], 'Print', lazy.spawn('gnome-screenshot')),

    # Audio
    Key([], 'XF86AudioMute', lazy.spawn('ponymix toggle')),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('ponymix increase 5')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('ponymix decrease 5')),
    Key([], 'XF86AudioPlay', lazy.spawn('playerctl play-pause')),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    Key([mod], "b",
         lazy.spawn(browser),
         desc='Qutebrowser'
    ),
    Key(
        [mod],
        "d",
        # lazy.spawn("appmenu"),
        lazy.spawn("dmenu_run -b -p 'Run: '"),
        desc="launcher-apps ",
    ),
    Key(
        [mod, "shift"],
        "d",
        lazy.spawn("jgmenu_run"),
        desc="jgmenu ",
    ),
    # Key(
    #     [],
    #     "Print",
    #     lazy.spawn("scrot '%S.png' -e -d 10'mv $f $$(xdg-user-dir PICTURES)/archlabs-%S-$wx$h.png ; feh $$(xdg-user-dir PICTURES)/archlabs-%S-$wx$h.png'"),
    #     desc="Print Screen",
   # ),
]


workspaces2 = [
    {"name": "111", "key": "1", "matches": ["firefox"]},
    {
        "name": "WEB",
        "key": "2",
        "matches": [
            "Thunderbird"
        ],
    },
    {
        "name": "TERM",
        "key": "3",
        "matches": [
            "joplin"
        ],
    },
]


workspaces = [
    {"name": "WWW", "key": "1", "matches": [Match(wm_class="firefox")]},
    {
        "name": "WEB",
        "key": "2",
        "matches": [
            Match(wm_class="Thunderbird"),
            Match(wm_class="transmission"),
            # Match(wm_class="gnome-calendar"),
        ],
    },
    {
        "name": "TERM",
        "key": "3",
        "matches": [
            Match(wm_class="joplin"),
            # Match(wm_class="libreoffice"),
            Match(wm_class="org.pwmt.zathura"),
        ],
    },
    {"name": "TXT", "key": "4", "matches": [Match(wm_class="geany")]},
    {"name": "FILES", "key": "5", "matches": [Match(wm_class="thunar")]},

    {
        "name": "EDIT",
        "key": "6",
        "matches": [
            # Match(wm_class="slack"),
            Match(wm_class="lightcord"),
            Match(wm_class="polari"),
        ],
    },
    {"name": "SYS", "key": "7", "matches": [Match(wm_class="spotify")]},
    {"name": "MEET", "key": "8", "matches": [Match(wm_class="gimp")]},
    {"name": "MUS", "key": "9", "matches": []},
    {
        "name": "MP4",
        "key": "0",
        "matches": [
            Match(wm_class="lxappearance"),
            Match(wm_class="pavucontrol"),
            Match(wm_class="connman-gtk"),
        ],
    },
]

groups = [
    ScratchPad(
        "scratchpad",
        [
            # define a drop down terminal.
            # it is placed in the upper third of screen by default.
            DropDown(
                "term",
                "alacritty --class dropdown -e tmux_startup.sh",
                height=0.6,
                on_focus_lost_hide=False,
                opacity=1,
                warp_pointer=False,
            ),
        ],
    ),
]


for workspace in workspaces:
    # matches = workspace["matches"] if "matches" in workspace else None
    # groups.append(Group(workspace["name"], matches=matches, layout="bsp"))
    groups.append(Group(workspace["name"], matches=None, layout="bsp"))
    keys.append(
        Key(
            [mod],
            workspace["key"],
            lazy.group[workspace["name"]].toscreen(),
            desc="Focus this desktop",
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]),
            desc="Move focused window to another group",
        )
    )

layout_theme = {
    "border_width": 2,
    "margin": 7,
    "border_focus": "5ccc96",
    "border_normal": "0f111b",
    "font": "FiraCode Nerd Font",
    "grow_amount": 2,
}

layouts = [
    CustomBsp(**layout_theme, fair=False),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    layout.Floating(**layout_theme, fullscreen_border_width=3, max_border_width=3),
]

# COLORS FOR THE BAR
colors2 = [
    ["#ecf0c1", "#ecf0c1"],  # ACTIVE WORKSPACES 0
    ["#686f9a", "#686f9a"],  # INACTIVE WORKSPACES 1
    ["#16172d", "#16172d"],  # background lighter 2
    ["#e33400", "#e33400"],  # red 3
    ["#5ccc96", "#5ccc96"],  # green 4
    ["#b3a1e6", "#b3a1e6"],  # yellow 5
    ["#00a3cc", "#00a3cc"],  # blue 6
    ["#f2ce00", "#f2ce00"],  # magenta 7
    ["#7a5ccc", "#7a5ccc"],  # cyan 8
    ["#686f9a", "#686f9a"],  # white 9
    ["#f0f1ce", "#f0f1ce"],  # grey 10
    ["#d08770", "#d08770"],  # orange 11
    ["#1b1c36", "#1b1c36"],  # super cyan12
    ["#0f111b", "#0f111b"],  # super blue 13
    ["#0e131a", "#0e131a"],  # super dark background 14
]


# colors = [
#     ["#ecf0c1", "#ecf0c1"],  # ACTIVE WORKSPACES 0
#     ["#686f9a", "#686f9a"],  # INACTIVE WORKSPACES 1
#     ["#16172d", "#16172d"],  # background lighter 2
#     ["#e33400", "#e33400"],  # red 3
#     ["#5ccc96", "#5ccc96"],  # green 4
#     ["#b3a1e6", "#b3a1e6"],  # yellow 5
#     ["#00a3cc", "#00a3cc"],  # blue 6
#     ["#f2ce00", "#f2ce00"],  # magenta 7
#     ["#7a5ccc", "#7a5ccc"],  # cyan 8
#     ["#686f9a", "#686f9a"],  # white 9
#     ["#f0f1ce", "#f0f1ce"],  # grey 10
#     ["#d08770", "#d08770"],  # orange 11
#     ["#1b1c36", "#1b1c36"],  # super cyan12
#     ["#0f111b", "#0f111b"],  # super blue 13
#     ["#0e131a", "#0e131a"],  # super dark background 14
# ]

colors = [
    ["#ecf0c1", "#ecf0c1"],  # background
    ["#fafafa", "#fafafa"],  # foreground
    ["#282828", "#282828"],  # background lighter
    ["#bf616a", "#bf616a"],  # red
    ["#a3be8c", "#a3be8c"],  # green
    ["#ebcb8b", "#ebcb8b"],  # yellow
    ["#81a1c1", "#81a1c1"],  # blue
    ["#b48ead", "#b48ead"],  # magenta
    ["#88c0d0", "#88c0d0"],  # cyan
    ["#4c566a", "#4c566a"],  # grey
    ["#e5e9f0", "#e5e9f0"],  # white
    ["#d08770", "#d08770"],  # orange
    ["#8fbcbb", "#8fbcbb"],  # super cyan
    ["#5e81ac", "#5e81ac"],  # super blue
    ["#242831", "#242831"],  # super dark background
]

group_box_settings = {
    "padding" : 0,
                    "borderwidth" : 3,
                    "active" : colors[10],
                    "inactive" : colors[1],
                    "disable_drag" : True,
                    "rounded" : True,
                    "margin_y" : 3,
                    "margin_x" : 2,
                    "padding_y" : 0,
                    "padding_x" : 0,
                    "hide_unused" :True,
                    "highlight_color" : colors[1],
                    "highlight_method" : "block",
                    "this_current_screen_border" : colors[0],
                    "this_screen_border" : colors [1],
                    "other_current_screen_border" : colors[1],
                    "other_screen_border" : colors[1],
                    "foreground" : colors[11],
                    "background" : colors[2],
}

widget_defaults = dict(
    font="novamono for powerline bold", fontsize=11, padding=3, background=colors[14]
)
extension_defaults = widget_defaults.copy()

def open_pavu():
    qtile.cmd_spawn("pavucontrol")

def open_jgmenu():
    qtile.cmd_spawn("jgmenu_run")

def open_calendar():
    qtile.cmd_spawn("gnome-calendar")

def open_pacman():
    qtile.cmd_spawn("alacritty -e sudo pacman -Syu")

screens = [
    Screen(
        wallpaper="/home/erlonbie/Downloads/gruvbox_astronaut2.png",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[2],
                        background = colors[2]
                        ),
                widget.Image(
                       filename="~/.config/qtile/icons/arch.png",
                       background=colors[2],
                       padding = 4,
                       margin=2,
                       mouse_callbacks={"Button1": open_jgmenu},
                       ),
                widget.GroupBox(
                    font="trebuchet ms",
                    # background=colors[2],
                    fontsize = 11,
                    visible_groups=["WWW"],
                    **group_box_settings,
                ),
                widget.GroupBox(
                    font="trebuchet ms",
                    fontsize = 11,
                    visible_groups=["WEB", "TERM", "TXT", "FILES", "EDIT"],
                    **group_box_settings,
                ),
                widget.GroupBox(
                    font="trebuchet ms",
                    fontsize = 11,
                    visible_groups=["SYS"],
                    **group_box_settings,
                ),
                widget.GroupBox(
                    font="trebuchet ms",
                    fontsize = 11,
                    visible_groups=["MEET", "MUS", "MP4"],
                    **group_box_settings,
                ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 24,
                       background = colors[2],
                       foreground = colors[2],
                       padding = 0
                       ),
                widget.TaskList(
                       font="trebuchet ms",
                       borderwidth=2,
                       padding=3,
                       margin=2,
                       highlight_method=colors[3],
                       border=colors[4],
                       background=colors[2],
                       ),
                # widget.Sep(
                #         linewidth = 1,
                #         padding = 10,
                #         foreground = colors[2],
                #         background = colors[1]
                #         ),
                # widget.Mpd2(),
                # widget.Mpd2(status_format="{play_status} {file}"),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[2],
                       foreground = colors[1],
                       padding = 0
                       ),
                widget.Battery(
                        update_interval = 3,
                        fontsize = 11,
                        format = '{char} {percent:2.0%}',
                        charge_char = '🔌',
                        discharge_char = '⚡️',
                        full_char = '🔋',
                        show_short_text = False,
                        foreground = colors[2],
                        background = colors[1],
	                    ),
                # widget.Spacer(
                #        background=colors[13],
                #        ),
                # widget.TextBox(
                #        text = "",
                #        font = "Iosevka_Nerd_Font",
                #        fontsize = 23,
                #        background = colors[13],
                #        foreground = colors[12],
                #        padding = 0
                #        ),
                # widget.TextBox(
                #        text = "",
                #        font = "Iosevka_Nerd_Font",
                #        fontsize = 23,
                #        background = colors[12],
                #        foreground = colors[7],
                #        padding = 0
                #        ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[1],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[12],
                       foreground = colors[7],
                       padding = 0
                       ),
                widget.TextBox(
                    text="🔅",
                    foreground=colors[13],
                    background=colors[7],
                    font = "feather",
                    fontsize=15,
                    padding=0,
                ),
                # widget.ThermalSensor(
                #          foreground = colors[13],
                #          foreground_alert = colors[13],
                #          background = colors[6],
                #          metric = True,
                #          padding = 4,
                #          threshold = 80
                #          ),
                widget.Backlight(
                         foreground = colors[2],
                         background = colors[7],
                         backlight_name = 'intel_backlight',
                         backlight_file = 'brightness',
                         max_brightness_file = 'max_brightness',
                         step = 10,
                         # change_command = 'xrandr --output eDP-1 --brightness {0}',
                         # change_command = 'echo '+str(meu_step)+' | sudo tee /sys/class/backlight/intel_backlight/brightness',
                         ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[7],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[12],
                       foreground = colors[5],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "👂",
                       font = "feather",
                       fontsize = 15,
                       background = colors[5],
                       foreground = colors[13],
                       padding = 0,
                       ),
                # widget.Memory(
                #         background=colors[5],
                #         foreground=colors[13],
                #         format='{MemUsed: .0f} MB ',
                #         ),
                widget.Volume(
                       foreground = colors[2],
                       background = colors[5],
                       padding = 5
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[5],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[12],
                       foreground = colors[4],
                       padding = 0
                       ),
                # widget.TextBox(
                #        text = "  ",
                #        font = "feather",
                #        fontsize = 12,
                #        foreground = colors[13],
                #        background = colors[4],
                #        padding = 0
                #        ),
                # widget.CPU (
                # foreground=colors[13],
                # background=colors[4],
                # ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[0],
                       background = colors[4],
                       padding = 0,
                       scale = 0.7
                       ),
              widget.CurrentLayout(
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[4],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[12],
                       foreground = colors[2],
                       padding = 0
                       ),
                widget.Systray(
                background = colors[2],
                ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[2],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[12],
                       foreground = colors[3],
                       padding = 0
                       ),
                widget.TextBox(
                       text = "⏰",
                       font = "feather",
                       fontsize = 15,
                       background = colors[3],
                       foreground = colors[13],
                       # padding = 3
                       ),
                widget.Clock(
                       background = colors[3],
                       foreground = colors[13],
                       mouse_callbacks={"Button1": open_calendar},
                ),
                widget.TextBox(
                       text = "",
                       font = "Iosevka_Nerd_Font",
                       fontsize = 23,
                       background = colors[3],
                       foreground = colors[12],
                       padding = 0
                       ),
                widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[12],
                        background = colors[12]
                        ),
            ],
            25,
            margin=[12, 15, 5, 15],
            opacity= 1.0,
        ),
        bottom=bar.Gap(18),
        left=bar.Gap(18),
        right=bar.Gap(18),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

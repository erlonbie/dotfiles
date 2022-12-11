import os
import re
import socket
import subprocess
from libqtile import hook
from libqtile import qtile
from typing import List
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import Spacer, Backlight
from libqtile.widget.image import Image
from libqtile.dgroups import simple_key_binder
from custom.bsp import Bsp as CustomBsp

import colors

myTerminal = "alacritty"
mod = "mod4"
alt = "mod1"
browser = "google-chrome-beta"
terminal = guess_terminal()
flameshot_full_screen = "flameshot screen -c"
flameshot_gui = "flameshot gui"
flameshot_save_path = "flameshot screen -p /home/erlonbie/Pictures/"
# flameshot_save_path = "scrot /home/erlonbie/Pictures/"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod],
        "m",
        lazy.layout.maximize(),
        desc="toggle window between minimum and maximum sizes",
    ),
    # Key([mod], "v", lazy.spawn("alacritty -e ranger"), desc='Use next layout on the actual group'),
    Key([mod], "v", lazy.spawn("neovide"), desc="Use next layout on the actual group"),
    Key(
        [mod],
        "semicolon",
        lazy.spawn("thunar"),
        desc="Use next layout on the actual group",
    ),
    Key(
        [mod],
        "Tab",
        lazy.spawn("rofi -show window"),
        desc="Use next layout on the actual group",
    ),
    Key(
        [mod],
        "Down",
        lazy.screen.next_group(),
        desc="Use next layout on the actual group",
    ),
    Key(
        [mod],
        "Up",
        lazy.screen.prev_group(),
        desc="Use next layout on the actual group",
    ),
    Key(
        [mod],
        "Right",
        lazy.group.next_window(),
        desc="Use next layout on the actual group",
    ),
    Key(
        [mod],
        "Left",
        lazy.group.prev_window(),
        desc="Use next layout on the actual group",
    ),
    Key([mod], "u", lazy.layout.shuffle_down()),
    Key([mod], "i", lazy.layout.shuffle_up()),
    Key([mod], "y", lazy.layout.shuffle_left()),
    Key([mod], "o", lazy.layout.shuffle_right()),
    # Treetab controls
    Key(
        [mod, "shift"], "i", lazy.layout.move_up(), desc="Move up a section in treetab"
    ),
    Key(
        [mod, "shift"],
        "u",
        lazy.layout.move_down(),
        desc="Move down a section in treetab",
    ),
    Key(
        [mod, "control"],
        "i",
        lazy.layout.section_up(),
        desc="Move up a section in treetab",
    ),
    Key(
        [mod, "control"],
        "u",
        lazy.layout.section_down(),
        desc="Move down a section in treetab",
    ),
    Key(
        [mod, "shift"],
        "y",
        lazy.layout.move_left(),
        desc="Move up a section in treetab",
    ),
    Key(
        [mod, "shift"],
        "o",
        lazy.layout.move_right(),
        desc="Move down a section in treetab",
    ),
    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brilho2 -inc 10000")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brilho2 -dec 10000")),
    Key([alt], "XF86MonBrightnessUp", lazy.spawn("brilho2 -inc 1000")),
    Key([alt], "XF86MonBrightnessDown", lazy.spawn("brilho2 -dec 1000")),
    # Screenshots
    Key([mod, "shift"], "Print", lazy.spawn(flameshot_gui)),
    Key([mod], "Print", lazy.spawn(flameshot_full_screen)),
    Key([], "Print", lazy.spawn(flameshot_save_path)),
    # Audio
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%-")),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([alt], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "x", lazy.spawn("betterlockscreen -l"), desc="lockscreen"),
    Key([mod], "b", lazy.spawn(browser), desc="Qutebrowser"),
    Key(
        [mod],
        "d",
        lazy.spawn("rofi -show combi -font 'CartographCF 12'"),
        desc="launcher-apps ",
    ),
    Key(
        [mod],
        "p",
        lazy.spawn("archlinux-logout"),
        desc="power menu screen",
    ),
    Key(
        [mod, "shift"],
        "d",
        lazy.spawn("jgmenu_run"),
        desc="jgmenu ",
    ),
    Key([mod], "w", lazy.to_screen(0), desc="Keyboard focus to monitor 1"),
    Key([mod], "e", lazy.to_screen(2), desc="Keyboard focus to monitor 2"),
    Key([mod], "r", lazy.to_screen(1), desc="Keyboard focus to monitor 3"),
    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen(), desc="Move focus to next monitor"),
    Key([mod], "comma", lazy.prev_screen(), desc="Move focus to prev monitor"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
]

workspaces = [
    {"name": "一", "key": "1", "matches": []},
    {
        "name": "二",
        "key": "2",
        "matches": [],
    },
    {
        "name": "三",
        "key": "3",
        "matches": [
            Match(wm_class="joplin"),
        ],
    },
    {"name": "四", "key": "4", "matches": []},
    {"name": "五", "key": "5", "matches": []},
    {
        "name": "六",
        "key": "6",
        "matches": [
            Match(wm_class="lightcord"),
            Match(wm_class="polari"),
        ],
    },
    {"name": "七", "key": "7", "matches": []},
    {"name": "八", "key": "8", "matches": []},
    {"name": "九", "key": "9", "matches": []},
    {
        "name": "十",
        "key": "0",
        "matches": [
            Match(wm_class="lxappearance"),
            Match(wm_class="pavucontrol"),
            Match(wm_class="pulseeffects"),
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
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout="bsp"))

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


dgroups_key_binder = simple_key_binder(mod)

colors, backgroundColor, foregroundColor, workspaceColor, chordColor = colors.kanagawa()

layout_theme = {
    "border_width": 5,  # 5
    "margin": 3,  # 7
    "border_focus": "215578",
    "border_normal": "0f111b",
    "font": "FiraCode Nerd Font",
    "grow_amount": 2,
}

layouts = [
    CustomBsp(**layout_theme, fair=False),
    layout.MonadWide(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.VerticalTile(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.TreeTab(
        font="CartographCF",
        fontsize=10,
        sections=["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        section_fontsize=10,
        bg_color="1c1f24",
        active_bg="c678dd",
        active_fg="000000",
        inactive_bg="a9a1e1",
        inactive_fg="1c1f24",
        padding_left=0,
        padding_x=0,
        padding_y=5,
        section_top=10,
        section_bottom=20,
        level_shift=8,
        vspace=3,
        panel_width=150,
    ),
    layout.Floating(
        **layout_theme,
        float_rules=[
            *layout.Floating.default_float_rules,
            Match(wm_class="calcurse"),
            Match(title="calcurse"),
        ],
    ),
]

group_box_settings = {
    "padding": 0,
    "borderwidth": 1,
    "active": colors[2],
    "inactive": colors[1],
    "disable_drag": True,
    "rounded": True,
    "margin_y": 3,
    "margin_x": 5,
    "padding_y": 0,
    "padding_x": 5,
    "hide_unused": True,
    "highlight_color": colors[3],
    "highlight_method": "block",
    # "this_current_screen_border" : colors[3],
    # "this_screen_border" : colors [8],
    # "other_current_screen_border" : colors[6],
    # "other_screen_border" : colors[7],
    # "foreground" : colors[11],
    # "background" : colors[2],
}

widget_defaults = dict(font="Ubuntu Bold", fontsize=12, padding=2, background=colors[0])
extension_defaults = widget_defaults.copy()


def open_calendar():
    qtile.cmd_spawn("alacritty -e calcurse")


def open_jgmenu():
    qtile.cmd_spawn("jgmenu_run")


def init_widgets_list(main_screen):
    tray = widget.Sep(linewidth=2, padding=5, foreground=colors[2])
    if main_screen == "main_screen":
        tray = widget.Systray(padding=5)
    widgets_list = [
        widget.Image(
            filename="~/.config/qtile/icons/arch.png",
            padding=5,
            margin=5,
            mouse_callbacks={"Button1": open_jgmenu},
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.GroupBox(
            font="CartographCF",
            fontsize=15,
            visible_groups=["一"],
            **group_box_settings,
        ),
        widget.GroupBox(
            font="CartographCF",
            fontsize=15,
            visible_groups=["二", "三", "四", "五", "六"],
            **group_box_settings,
        ),
        widget.GroupBox(
            font="CartographCF",
            fontsize=15,
            visible_groups=["七"],
            **group_box_settings,
        ),
        widget.GroupBox(
            font="CartographCF",
            fontsize=15,
            visible_groups=["八", "九", "十"],
            **group_box_settings,
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TaskList(
            font="CartographCF",
            fontsize=14,
            borderwidth=2,
            rounded=True,
            padding=3,
            margin=2,
            icon_size=15,
            highlight_method="block",
        ),
        widget.Chord(
            chords_colors={
                "launch": (chordColor, foregroundColor),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.Battery(
            update_interval=3,
            fontsize=13,
            format="{char} {percent:2.0%}",
            charge_char="",
            discharge_char="",
            full_char="",
            show_short_text=False,
            foreground=colors[5],
            padding=5,
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text=" ",
            foreground=colors[6],
            # fontsize=23,
        ),
        widget.Backlight(
            foreground=colors[6],
            backlight_name="intel_backlight",
            backlight_file="brightness",
            max_brightness_file="max_brightness",
            step=10,
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text="墳",
            foreground=colors[8],
            # fontsize=23,
        ),
        widget.Volume(fmt="{}", foreground=colors[8], padding=5),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        # widget.CurrentLayoutIcon(scale=0.7),
        widget.CurrentLayoutIcon(scale=0.5),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text="",
            foreground=colors[4],
            # fontsize=23,
        ),
        widget.Memory(
            foreground=colors[4],
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerminal + " -e htop")
            },
            fmt="{}",
            padding=5,
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text="",
            foreground=colors[10],
            # fontsize=23,
        ),
        widget.CPU(
            format="{freq_current}GHz {load_percent}%",
            padding=5,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerminal + " -e htop")
            },
            foreground=colors[10],
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text="",
            foreground=colors[9],
            # fontsize=15,
        ),
        widget.ThermalSensor(
            foreground=colors[9],
            background=colors[0],
            threshold=70,
            fmt="{}",
            padding=5,
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        widget.TextBox(
            text=" ",
            foreground=colors[7],
            # fontsize=23,
        ),
        widget.Wlan(
            foreground=colors[7],
            interface="wlp0s20f3",
            padding=5,
            format="{essid} {percent:2.0%}",
        ),
        widget.Sep(linewidth=2, padding=5, foreground=colors[2]),
        # widget.Systray(padding=5),
        tray,
        widget.Sep(linewidth=2, padding=5, foreground=foregroundColor),
        widget.TextBox(
            text=" ",
            foreground=colors[2],
            # fontsize=23,
        ),
        widget.Clock(
            format="%a %d %m %Y |  %I:%M %p",
            foreground=colors[2],
            padding=10,
            mouse_callbacks={"Button1": open_calendar},
        ),
    ]
    return widgets_list


def init_widgets_screen(screen_type):
    widgets_screen1 = init_widgets_list(screen_type)
    return widgets_screen1


def init_screens():
    return [
        Screen(
            wallpaper="/home/erlonbie/Downloads/kana_wall.jpg",
            wallpaper_mode="fill",
            top=bar.Bar(
                widgets=init_widgets_screen("main_screen"), opacity=1.0, size=25
            ),
        ),
        Screen(
            wallpaper="/home/erlonbie/Downloads/kana_wall.jpg",
            wallpaper_mode="fill",
            top=bar.Bar(
                widgets=init_widgets_screen("not_main_screen"), opacity=1.0, size=25
            ),
        ),
        Screen(
            wallpaper="/home/erlonbie/Downloads/kana_wall.jpg",
            wallpaper_mode="fill",
            top=bar.Bar(
                widgets=init_widgets_screen("not_main_screen"), opacity=1.0, size=25
            ),
        ),
    ]


#
if __name__ in ["config", "__main__"]:
    screens = init_screens()

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod, "shift"],
        "Button1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=colors[8],
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="kdenlive"),  # gitk
        Match(wm_class="gimp"),  # gitk
        Match(wm_class="mypaint"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# Programms to start on log in


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


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

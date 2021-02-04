# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import subprocess
from libqtile import hook

@hook.subscribe.startup_once
def autostart():
    subprocess.Popen(['/home/salatiel/.config/qtile/autostart.sh'])

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows in current stack pane
    #  Key([mod], "k", lazy.layout.down(),
    #      desc="Move focus down in stack pane"),
    #  Key([mod], "j", lazy.layout.up(),
    #      desc="Move focus up in stack pane"),
    #  Key([mod], "Left", lazy.layout.left(),
    #      desc="Move focus down in stack pane"),
    #  Key([mod], "Right", lazy.layout.right(),
    #      desc="Move focus up in stack pane"),

    #  MonadTall
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "control"], "Right", lazy.layout.grow()),
    Key([mod, "control"], "Left", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "Return", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),


    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    Key([mod, "shift"], "Left", lazy.layout.decrease_ratio(),
        desc="Decrease layout ratio"),
    Key([mod, "shift"], "Right", lazy.layout.increase_ratio(),
        desc="Increase layout ratio"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "e", lazy.spawn("termite -e vifm"), desc="Open file browser"),
    #  Key([mod], "d", lazy.spawn("dmenu_run -fn 'Font Awesome Regular 5:pixelsize=13' -nb '#282C34' -sb '#C678DD' "),
    Key([mod], "d", lazy.spawn("termite -t launcher -e /home/salatiel/scripts/lawnchair"), desc="Custom launcher"),


    # Change the volume if your keyboard has special volume keys.
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -D pulse sset Master '5%+'")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -D pulse sset Master '5%-'")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -D pulse set Master toggle")
    ),
    Key(
        [], "XF86AudioPlay",
        lazy.spawn("playerctl play-pause")
    ),
    Key(
        [], "XF86AudioNext",
        lazy.spawn("playerctl next")
    ),
    Key(
        [], "XF86AudioPrev",
        lazy.spawn("playerctl previous")
    ),
    Key(
        [], "XF86AudioStop",
        lazy.spawn("playerctl stop")
    ),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

colorsOnedark = {
            "black"     : "#282C34", # 0
            "red"       : "#E06C75", # 1
            "green"     : "#98C379", # 2
            "yellow"    : "#E5C07B", # 3
            "blue"      : "#61AFEF", # 4
            "magenta"   : "#C678DD", # 5
            "cyan"      : "#56B6C2", # 6
            "gray"      : "#ABB2BF", # 7
            "comm"      : "#6F7A91", # 8
        }

Onedark = [ "#282C34", "#E06C75", "#98C379", "#E5C07B", "#61AFEF", "#C678DD", "#56B6C2", "ABB2BF", "#5C6370"]

layouts = [
    #  layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    layout.MonadTall(border_focus=Onedark[4],
                margin=8,
                border_width=2,
                shift_windows=True,),
    # layout.MonadWide(),
    # layout.RatioTile(),
    #  layout.Tile(border_focus=Onedark[4],
    #              margin=6,
    #              border_width=2,
    #              shift_windows=True,
    #      ),
    layout.Max(),
    layout.Floating(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    layout.Zoomy(columnwidth=550,
                margin=6,),
]

widget_defaults = dict(
    font='Font Awesome Regular 5',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(background=Onedark[0],
                                block_highlight_text_color='#FFFFFF',
                                border_width=0,
                                highlight_color=[Onedark[4], Onedark[4]],
                                highlight_method='line',
                                inactive=Onedark[8],
                    ),
                #  widget.Prompt(),
                widget.CurrentLayoutIcon(background=Onedark[0], fontsize=10, scale=0.7),
                widget.TextBox(" │ ", foreground=Onedark[8], background=Onedark[0]),
                widget.WindowName(fontsize=10,background=Onedark[0]),
                #  widget.Net(background=Onedark[0],interface="enp2s0", format="{down}↓↑{up}", foreground=Onedark[6]),
                widget.TextBox(" │ ", foreground=Onedark[8], background=Onedark[0]),
                widget.TextBox("CPU ", fontsize=10, foreground=Onedark[5], background=Onedark[0]),
                widget.CPUGraph(background=Onedark[0],
                                border_width=1,
                                border_color=Onedark[5],
                                graph_color=Onedark[5]),
                widget.TextBox(" │ ", foreground=Onedark[8], background=Onedark[0]),
                widget.TextBox("RAM ", fontsize=10, foreground=Onedark[3], background=Onedark[0]),
                widget.MemoryGraph( background=Onedark[0],
                                    border_width=1,
                                    border_color=Onedark[3],
                                    graph_color=Onedark[3]),
                widget.TextBox(" │ ", foreground=Onedark[8], background=Onedark[0]),
                widget.Volume(fmt=" {}", background=Onedark[0], foreground=Onedark[2]),
                widget.TextBox(" │ ", foreground=Onedark[8], background=Onedark[0]),
                widget.Clock(format='%a, %d %B %l:%M%p', background=Onedark[0]),
                widget.TextBox("  ", foreground=Onedark[8], background=Onedark[0]),
            ],
            24,
        opacity=0.7, margin=0),
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
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wmclass': 'ngspice'},  # gitk
    {'wmclass': 'gnuplot'},  # gitk
    {'wmclass': 'gnuplot_qt'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'launcher'},  # dmenu delete
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

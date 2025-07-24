from libqtile import bar, layout, widget
from libqtile.config import Match, Screen


class Catppuccin():

    def __init__(self) -> None:
        self.layouts: list = [
            layout.Bsp(margin=3,
                       border_width=1,
                       border_focus="#b4befe",
                       border_normal="#1e1e2e"),
            layout.Max()
        ]
        self.widget_defaults: dict = {
            "padding": 3,
            "fontsize": 14,
            "foreground": "#cdd6f4",
            "background": "#1e1e2e00",
            "font": "CaskaydiaCove Nerd Font"
        }
        self.screen: list = [
            Screen(
                bottom=bar.Bar(
                    [
                        widget.GroupBox(),
                        widget.Prompt(),
                        widget.Sep(linewidth=2),
                        widget.WindowName(),
                        widget.Sep(linewidth=2),
                        widget.Systray(),
                        widget.Sep(linewidth=2),
                        widget.Clock(format='%H:%M %a %d/%m'),
                    ],
                    24,
                ),
                wallpaper='~/.config/qtile/wallpapers/castlevania.jpg',
                wallpaper_mode='stretch',
            )
        ]
        self.floating_layout = layout.Floating(float_rules=[
            *layout.Floating.default_float_rules,
            Match(wm_class="confirmreset"),  # gitk
            Match(wm_class="makebranch"),  # gitk
            Match(wm_class="maketag"),  # gitk
            Match(wm_class="ssh-askpass"),  # ssh-askpass
            Match(title="branchdialog"),  # gitk
            Match(title="pinentry"),  # GPG key password entry
            Match(title="Steam"),
            Match(title="steam"),
        ])

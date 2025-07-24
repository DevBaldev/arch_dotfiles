from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy


class AllKeys():

    def __init__(self) -> None:
        self.directions: list = ["left", "downward", "upward", "right"]
        self.mods: dict = {
            "mod": ["mod4"],
            "shiftMod": ["mod4", "shift"],
            "ctrlMod": ["mod4", "control"]
        }
        self.vim_keys: dict = {
            "left": "h",
            "downward": "j",
            "upward": "k",
            "right": "l"
        }
        self.functions: dict = {
            "left": {
                "switch": lazy.layout.left(),
                "shuffle": lazy.layout.shuffle_left(),
                "grow": lazy.layout.grow_left()
            },
            "downward": {
                "switch": lazy.layout.down(),
                "shuffle": lazy.layout.shuffle_down(),
                "grow": lazy.layout.grow_down()
            },
            "upward": {
                "switch": lazy.layout.up(),
                "shuffle": lazy.layout.shuffle_up(),
                "grow": lazy.layout.grow_up()
            },
            "right": {
                "switch": lazy.layout.right(),
                "shuffle": lazy.layout.shuffle_right(),
                "grow": lazy.layout.grow_right()
            }
        }
        self.applications: dict = {
            "terminal": "kitty",
            "browser": "librewolf",
            "code": "kitty nvim"
        }

    def switch_move_resize_window(self) -> list:
        result: list = list()
        for i in self.directions:
            result.append(
                Key(self.mods["mod"], self.vim_keys[i],
                    self.functions[i]["switch"]))
            result.append(
                Key(self.mods["shiftMod"], self.vim_keys[i],
                    self.functions[i]["shuffle"]))
            result.append(
                Key(self.mods["ctrlMod"], self.vim_keys[i],
                    self.functions[i]["grow"]))
        return result

    def move_switch_groups(self) -> list:
        result: list = list()
        groups = [Group(str(i)) for i in range(1, 10)]
        for group in groups:
            result.extend([
                Key(self.mods["mod"], group.name,
                    lazy.group[group.name].toscreen()),
                Key(self.mods["shiftMod"], group.name,
                    lazy.window.togroup(group.name, switch_group=True))
            ])
        return result

    def open_applications(self) -> list:
        app: dict = self.applications
        result: list = [
            Key(self.mods["mod"], "r", lazy.spawncmd()),
            Key(self.mods["mod"], "q", lazy.window.kill()),
            Key(self.mods["mod"], "f", lazy.spawn(app["browser"])),
            Key(self.mods["mod"], "t", lazy.spawn(app["terminal"])),
        ]
        return result

    def window_layouts(self) -> list:
        result: list = [
            Key(self.mods["mod"], "Tab", lazy.next_layout()),
            Key(self.mods["ctrlMod"], "q", lazy.shutdown()),
            Key(self.mods["ctrlMod"], "r", lazy.reload_config()),
            Key(self.mods["mod"], "return", lazy.window.toggle_fullscreen()),
            Key(self.mods["shiftMod"], "return", lazy.window.toggle_floating())
        ]
        return result

    def keybindings(self) -> list:
        return (self.switch_move_resize_window() + self.move_switch_groups() +
                self.window_layouts() + self.open_applications())

    def mouse_keybindings(self) -> list:
        result: list = [
            Drag(self.mods["mod"],
                 "Button1",
                 lazy.window.set_position_floating(),
                 start=lazy.window.get_position()),
            Drag(self.mods["mod"],
                 "Button3",
                 lazy.window.set_size_floating(),
                 start=lazy.window.get_size()),
            Click(self.mods["mod"], "Button2", lazy.window.bring_to_front()),
        ]
        return result

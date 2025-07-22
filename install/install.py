import os
import tomllib


def main() -> None:
    sys_update()
    paru_install()
    pkgs_install()
    change_shell()
    dotfiles_copy()


def sys_update() -> None:
    """Update whole system."""
    os.system(f"sudo pacman -Syu")


def paru_install() -> None:
    """Installing aur helper (paru)."""
    os.system("git clone https://aur.archlinux.org/paru.git")  # Clone paru repo
    os.system("cd paru; makepkg -si")  # Makeing the pkg
    os.system("sudo rm -r paru")  # removing paru repo


def load_toml() -> dict:
    """Load TOML data from applications.toml"""
    with open("applications.toml", "rb") as f:
        toml_data: dict = tomllib.load(f)
        return toml_data


def pkgs_install() -> None:
    """Install list of applications."""
    pkgs: list = [i for i in load_toml().values()]
    os.system(f"paru -Sy --needed {' '.join(pkgs)}")


def change_shell() -> None:
    """Change default shell to fish."""
    os.system("paru -Sy --needed fish starship")
    os.system('chsh -s "$(which fish)"')


def dotfiles_copy() -> None:
    """Copy every dotfiles to user's home."""
    os.system("cp -r ../.* ~/")


if __name__ == "__main__":
    main()

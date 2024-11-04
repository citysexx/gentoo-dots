# gentoo-dots
Dotfiles and install advices for Gentoo Linux x Hyprland setup

## Prerequisites:
- Amd64-architecture computer
- It is assumed you have installed Gentoo Linux using AMD64 Handbook and set up a minimal recommended configuartion described in this Handbook
- Guru Repository Enabled
- Packages:
    - `hyprland`
    - `hyprpaper`
    - `hyprshot`
    - [Not Obligatory, but Recommended] other hyprland ecosystem packages
    - `gojq`
    - `wofi`
    - `tofi`
    - `dunst`
    - `ranger`
    - `neovim`
    - `noto-emoji`
    - `kitty`
    - `waybar`
- Nerd Font (You can use any, but the dots are configured with InconsolataLGCNerdFont, which I share with you in fonts directory)

## Other packages
- `qutebrowser` (warning, qtwebengine takes long to build, around 2-3 hours on AMD Ryzen 7 7730U (16) @ 4.55 GHz)
- `qbittorrent` - torrent client

## Bonus: Script to automatically backup your dotfiles
The `backup.sh` can copy your configuration files in case you want to reproduce it quick without tinkering again on another machine, but NOTE: 
1. Read the scripts that you launch from the Internet before you run them as some may severely damage your system or brick your laptop
2. This script should be run as root using sudo. Other attempts will result in the behavior I have not fully processed and tested in this script
3. run ./backup.sh --help to see options
4. Do NOT backup files from "/" to git repository. If you are sysadmin, ensure you backup them to an external drive. In other cases, backup only files and dirs you have permissions to, and that do not contain sensitive data!

## Future considerations
*Note* that this repo does not aim to provide the full OOTB desktop experience. These dotfiles, as well as script, are for the community members who want a clean (without ton of deps) ricing base. Use this repo to build your own setup and do not forget to share it!

Regards, 
citysexx

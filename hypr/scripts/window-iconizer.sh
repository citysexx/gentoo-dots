#!/bin/bash

# Get the currently focused window's class and title using hyprctl
window_class=$(hyprctl activewindow | grep "Class" | awk -F': ' '{print $2}')
window_title=$(hyprctl activewindow | grep "Title" | awk -F': ' '{print $2}')

# Check if there is no focused window
if [ -z "$window_class" ] || [ -z "$window_title" ]; then
    echo "No window"
    exit 0
fi

# Define a basic icon mapping based on the window class
case "$window_class" in
    "firefox")
        echo "    $window_title"  # Firefox icon
        ;;
    "chrome" | "google-chrome")
        echo "    $window_title"  # Google Chrome icon
        ;;
    "neovim")
        echo "    $window_title"  # Neovim icon
        ;;
    "zen")
        echo "    $window_title"  # Zen Browser icon
        ;;
    "kitty")
        echo "    $window_title"   # Terminal icon
        ;;
    "gnome-terminal")
        echo "    $window_title"  # GNOME Terminal icon
        ;;
    "gnome-console")
        echo "    $window_title"  # GNOME Terminal icon
        ;;
    "xterm")
        echo "    $window_title"  # XTerm icon
        ;;
    "steam")
        echo "    $window_title"  # Steam icon
        ;;
    "discord")
        echo "    $window_title"  # Discord icon
        ;;
    "slack")
        echo "    $window_title"  # Slack icon
        ;;
    "vlc")
        echo "    $window_title"  # VLC Player icon
        ;;
    "spotify")
        echo "    $window_title"  # Spotify icon
        ;;
    "thunderbird")
        echo "    $window_title"  # Thunderbird icon
        ;;
    "code" | "vscode")
        echo "    $window_title"  # VSCode icon
        ;;
    "sublime_text")
        echo "    $window_title"  # Sublime Text icon
        ;;
    "eclipse")
        echo "    $window_title"  # Eclipse IDE icon
        ;;
    "nautilus" | "file-manager")
        echo "    $window_title"  # Nautilus (File Manager) icon
        ;;
    "gedit")
        echo "    $window_title"  # Text editor icon
        ;;
    "gnome-software")
        echo "    $window_title"  # GNOME Software icon
        ;;
    "system-settings")
        echo "    $window_title"  # System Settings icon
        ;;
    "geany")
        echo "    $window_title"  # Geany IDE icon
        ;;
    "jetbrains-idea")
        echo "    $window_title"  # JetBrains IDE icon
        ;;
    "matplotlib")
        echo "    $window_title"  # Matplotlib (Python plotting) icon
        ;;
    "gimp")
        echo "    $window_title"  # GIMP icon
        ;;
    "inkscape")
        echo "    $window_title"  # Inkscape icon
        ;;
    "blender")
        echo "    $window_title"  # Blender icon
        ;;
    "obs-studio")
        echo "    $window_title"  # OBS Studio icon
        ;;
    "libreoffice")
        echo "    $window_title"  # LibreOffice icon
        ;;
    "teamviewer")
        echo "    $window_title"  # TeamViewer icon
        ;;
    "zoom")
        echo "    $window_title"  # Zoom icon
        ;;
    "skype")
        echo "    $window_title"  # Skype icon
        ;;
    "org.telegram.desktop")
        echo "    $window_title"  # Telegram icon
        ;;
    "telegram")
        echo "    $window_title"  # Telegram icon
        ;;
    "slack")
        echo "    $window_title"  # Slack icon
        ;;
    "mailspring")
        echo "    $window_title"  # Mailspring icon
        ;;
    "element")
        echo "    $window_title"  # Element icon (Matrix client)
        ;;
    "audacity")
        echo "    $window_title"  # Audacity icon
        ;;
    "gedit")
        echo "    $window_title"  # Gedit icon
        ;;
    "peek")
        echo "    $window_title"  # Peek (GIF recorder) icon
        ;;
    "kdenlive")
        echo "    $window_title"  # Kdenlive (video editor) icon
        ;;
    "virtualbox")
        echo "    $window_title"  # VirtualBox icon
        ;;
    "docker")
        echo "    $window_title"  # Docker icon
        ;;
    "openvpn")
        echo "    $window_title"  # OpenVPN icon
        ;;
    "telegram-desktop")
        echo "    $window_title"  # Telegram Desktop icon
        ;;
    "signal")
        echo "    $window_title"  # Signal icon
        ;;
    "whatsapp")
        echo "    $window_title"  # WhatsApp icon
        ;;
    "gnome-calculator")
        echo "    $window_title"  # GNOME Calculator icon
        ;;
    "gnome-maps")
        echo "    $window_title"  # GNOME Maps icon
        ;;
    "geary")
        echo "    $window_title"  # Geary icon
        ;;
    "keepassxc")
        echo "    $window_title"  # KeePassXC icon
        ;;
    "krfb")
        echo "ﯩ    $window_title"  # KRFB (VNC server) icon
        ;;
    "filezilla")
        echo "    $window_title"  # FileZilla icon
        ;;
    "audacity")
        echo "    $window_title"  # Audacity icon
        ;;
    "peazip")
        echo "    $window_title"  # PeaZip icon
        ;;
    "qemu")
        echo "    $window_title"  # QEMU icon
        ;;
    "rambox")
        echo "    $window_title"  # Rambox icon (messaging client)
        ;;
    "franz")
        echo "    $window_title"  # Franz icon (messaging client)
        ;;
    "kdeconnect")
        echo "    $window_title"  # KDE Connect icon
        ;;
    "xfce4-taskmanager")
        echo "    $window_title"  # XFCE Task Manager icon
        ;;
    "gnome-system-monitor")
        echo "    $window_title"  # GNOME System Monitor icon
        ;;
    "systemsettings")
        echo "    $window_title"  # System Settings icon
        ;;
    "nautilus")
        echo "    $window_title"  # File Manager icon
        ;;
    "scrcpy")
        echo "    $window_title"  # Scrcpy icon (Android screen mirroring)
        ;;
    "postman")
        echo "    $window_title"  # Postman icon (API tool)
        ;;
    *)
        echo "    $window_title"  # Default window icon
        ;;
esac


if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export WLR_NO_HARDWARE_CURSORS=1
    exec sway
fi
#
#
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK


# Created by `pipx` on 2025-04-17 00:24:44
export PATH="$PATH:/home/prime/.local/bin"

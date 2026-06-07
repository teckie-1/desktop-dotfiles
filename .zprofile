if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
#
#
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK


# Created by `pipx` on 2025-04-17 00:24:44
export PATH="$PATH:/home/prime/.local/bin"

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    export WLR_NO_HARDWARE_CURSORS=1
    exec sway
fi


# Created by `pipx` on 2025-04-17 00:24:44
export PATH="$PATH:/home/prime/.local/bin"

#!/bin/bash


DOTFILES_DIR="$HOME/Dotfiles/desktop-dotfiles"
DOTFILES_REPO="git@github.com:teckie-1/desktop-dotfiles.git"
PRIVATE_REPO="git@github.com:teckie-1/desktop-dotfiles-private.git"

echo "==> Starting bootstrap..."

# Install yay if not present
if ! command -v yay &>/dev/null; then
    echo "==> Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd "$HOME"
fi

# Clone dotfiles repos
mkdir -p "$HOME/Dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "==> Cloning public dotfiles..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

if [ ! -d "$HOME/Dotfiles/desktop-dotfiles-private" ]; then
    echo "==> Cloning private dotfiles..."
    git clone "$PRIVATE_REPO" "$HOME/Dotfiles/desktop-dotfiles-private"
fi

# Install packages
echo "==> Installing pacman packages..."
awk '{print $1}' "$DOTFILES_DIR/packages.txt" | sudo pacman -S --needed --noconfirm -

echo "==> Installing AUR packages..."
yay -S --needed --noconfirm $(awk '{print $1}' "$DOTFILES_DIR/packages-aur.txt" | tr '\n' ' ')

# Create symlinks for .config
echo "==> Creating symlinks..."
mkdir -p "$HOME/.config"

configs=(
    btop
    cava
    fastfetch
    kanshi
    kitty
    lazygit
    nvim
    sway
    swaylock
    waybar
    yazi
    zathura
)

for config in "${configs[@]}"; do
    target="$HOME/.config/$config"
    source="$DOTFILES_DIR/.config/$config"
    if [ -e "$target" ]; then
        echo "  skipping $config — already exists"
    else
        ln -s "$source" "$target"
        echo "  linked $config"
    fi
done

# Symlink home dotfiles
home_files=(
    .zshrc
    .zshenv
    .zprofile
    .p10k.zsh
)

for file in "${home_files[@]}"; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"
    if [ -e "$target" ]; then
        echo "  skipping $file — already exists"
    else
        ln -s "$source" "$target"
        echo "  linked $file"
    fi
done

# Symlink private dotfiles
echo "==> Linking private dotfiles..."
if [ -f "$HOME/Dotfiles/desktop-dotfiles-private/.gitconfig" ]; then
    ln -sf "$HOME/Dotfiles/desktop-dotfiles-private/.gitconfig" "$HOME/.gitconfig"
    echo "  linked .gitconfig"
fi

if [ -f "$HOME/Dotfiles/desktop-dotfiles-private/.ssh_config" ]; then
    mkdir -p "$HOME/.ssh"
    ln -sf "$HOME/Dotfiles/desktop-dotfiles-private/.ssh_config" "$HOME/.ssh/config"
    echo "  linked .ssh/config"
fi

echo ""
echo "==> Done. Restart your terminal or run: source ~/.zshrc"

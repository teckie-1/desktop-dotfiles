# desktop-dotfiles

My personal dotfiles for my Arch Linux desktop. Running SwayFX on Wayland with Neovim as my editor.

![fastfetch](assets/fastfetch.jpg)

## What's in here

- **sway** — window manager config
- **environment.d** — systemd user session env vars (GTK/Qt theming, portals)
- **waybar** — status bar
- **swaylock** — lock screen
- **kitty** — terminal
- **nvim** — Neovim config (LazyVim based)
- **kanshi** — display management
- **fastfetch** — system info
- **btop** — system monitor
- **cava** — audio visualizer
- **lazygit** — git TUI
- **yazi** — file manager
- **zathura** — PDF viewer
- **setwall** — wallpaper script (pywal + waybar/GTK/qutebrowser theming)
- **qt5ct** / **qt6ct** — Qt app theming (Fusion + dark palette, for Qt apps to match GTK dark mode)

Everything in here is public and safe to grab — no machine-specific setup or private stuff lives in this repo.

## Grabbing everything

Clone the repo and symlink the configs to their expected locations:

```bash
git clone https://github.com/teckie-1/desktop-dotfiles.git
ln -s ~/desktop-dotfiles/.config/sway ~/.config/sway
```

Repeat for each config you want.

## Just want one config?

You don't need the whole repo for that. Sparse checkout will pull down just the folder you ask for:

```bash
git clone --filter=blob:none --sparse https://github.com/teckie-1/desktop-dotfiles.git
cd desktop-dotfiles
git sparse-checkout set .config/nvim
```

Then symlink (or copy) it wherever you need it:

```bash
ln -s "$(pwd)/.config/nvim" ~/.config/nvim
```

Or skip cloning entirely — GitHub lets you browse into any `.config/<thing>` folder and download individual files straight from the repo page.

## System

- OS: Arch Linux
- WM: SwayFX (Wayland)
- Terminal: Kitty
- Editor: Neovim
- Shell: Zsh + Oh My Zsh

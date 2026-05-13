# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_THEME="powerlevel10k/powerlevel10k"

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh




export COLORTERM=truecolor
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/bin:/usr/bin:/bin:/usr/local/bin:/var/lib/flatpak/exports/bin"

# Ollama 
export OLLAMA_HOST="http://100.108.221.49:30068"
alias yoda='ollama run llama3.1'

# Alias 
alias fuckoff='clear; echo "Bye Bitch!!"; sleep 5; systemctl poweroff'
alias zzz='clear; echo "Goodnight Sir"; sleep 3; systemctl suspend'
alias yeet='sudo pacman -Rns'
alias npasswd='cd ~/.password-store'
alias wgup='sudo wg-quick up wg0; echo wg0 is up'
alias wgdown='sudo wg-quick down wg0; echo wg0 is down'
alias gitsync='git add -A && git commit -m update && git push'
alias weather='curl wttr.in/Elkhart'
alias camera='guvcview'
alias lsbc='bat -l conf -p'
alias scripts='~/.local/bin/'
alias img='kitty +kitten icat'
alias gparted='sudo -E gparted'
alias mixer='alsamixer'
alias music='termsonic'
alias kalishell='sudo virsh start kali >/dev/null 2>&1 || true; ssh prime@192.168.122.166'
alias kali='sudo virsh start kali >/dev/null 2>&1 || true; xfreerdp3 /v:192.168.122.166 /u:prime'
alias rpi-imager='sudo -E QT_QPA_PLATFORM=wayland rpi-imager'
#ZSH_THEME="


# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat='bat'


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Loadpywal colors into the terminal
# (cat ~/.cache/wal/sequences &)

export EDITOR=nvim
export VISUAL=nvim

# Show custom banner and system info with full color
# Show banner and info only in interactive, fully loaded terminals

# Force color support early
export COLORTERM=truecolor
export TERM=kitty
export COLORFGBG="15;0"


if [[ $- == *i* ]]; then
  sleep 0.00                     # wait for color envs to load
  figlet -f slant "Teckie1" | lolcat
  tput sgr0
  echo
  command fastfetch-colored

fi

alias virt-manager='VIRT_MANAGER_CONSOLE=remote-viewer virt-manager'


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/prime/.dart-cli-completion/zsh-config.zsh ]] && . /home/prime/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
alias files="thunar"
export PATH="$HOME/.local/bin:$PATH"

# ---- colored man pages ----
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# ---- use bat as man pager ----
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR=nvim
export VISUAL=nvim

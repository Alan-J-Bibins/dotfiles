# ----------------------------------------
# Environment Variables
# ----------------------------------------
export ZSH="$HOME/.zsh"
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/kitty"
export HISTFILE="$ZSH/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export NODE_OPTIONS="--disable-warning=ExperimentalWarning"
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANDROID_HOME="$HOME/Android/Sdk"
export PYENV_ROOT="$HOME/.pyenv"
export SDKMAN_DIR="$HOME/.sdkman"

# Add custom paths
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/Applications/:$HOME/dotfiles/Scripts/"

# Deno environment
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# ----------------------------------------
# History Options
# ----------------------------------------
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# ----------------------------------------
# Aliases
# ----------------------------------------
alias l="eza -lah"
alias n="nvim"
alias n2="NVIM_APPNAME='nvim2' nvim"
alias t="tmux"
alias tkill="tmux kill-server"
alias ta="tmux attach -t"
alias tx="tmuxinator"
alias nf="nvim ./"
alias ls="eza"
alias gpus='lspci -k | grep -A 2 -E "(VGA|3D)"'
alias clera="clear"
alias update='yay -Syu --disable-download-timeout'
alias storage="df -h | grep 'Filesystem\|nvme'"
alias py='python3'
alias fixgpgme='sudo rm -r /var/lib/pacman/sync/'
alias yt-dlp-aria="yt-dlp --downloader aria2c --downloader-args '-c -j 3 -x 3 -s 3 -k 1M'"
alias q="yay -Qi"
alias i="yay -S"
alias s='yay -Ss'
alias yeet='yay -R'
alias lg='lazygit'
alias reloadwaybar='killall -SIGUSR2 waybar'
alias tsl='sudo -E timeshift-launcher'
alias ff='clear && fastfetch'
alias searchfont='fc-list | rg -i'

# ----------------------------------------
# Functions
# ----------------------------------------

function countdown() {
    termdown $1 && play -q -n synth 5 sin 100-1000
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

function dls() {
    du -shc * | sort -h
}

function sesh-sessions() {
    {
        exec </dev/tty
        exec <&1
        local session
        session=$(sesh list -T | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
        zle reset-prompt >/dev/null 2>&1 || true
        [[ -z "$session" ]] && return
        sesh connect $session
    }
}
zle -N sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# ----------------------------------------
# Completion System Setup (Optimized)
# ----------------------------------------

# Add zsh-completions and system completions to fpath
fpath=(
    $ZSH/plugins/zsh-completions/src
    /usr/share/zsh/site-functions
    /usr/share/zsh/functions/Completion
    $fpath
)

# Disable compfix security checks (optional, but speeds up)
ZSH_DISABLE_COMPFIX=true

# Only regenerate compdump if older than 1 day
autoload -Uz compinit
if [[ ! -f ${ZDOTDIR:-$HOME}/.zcompdump || ${ZDOTDIR:-$HOME}/.zcompdump -ot /bin/date ]]; then
    compinit -C
else
    compinit -C
fi

# Completion styles
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive matching
zstyle ':completion:*' menu select                        # Interactive menu selection
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ----------------------------------------
# Plugin Sourcing (after compinit)
# ----------------------------------------

# Fast syntax highlighting (keep at end)
source "$ZSH/plugins/fsh/F-Sy-H.plugin.zsh"

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF plugin (from Oh-My-Zsh)
[ -f "$ZSH/plugins/fzf.plugin.zsh" ] && source "$ZSH/plugins/fzf.plugin.zsh"

# ----------------------------------------
# Python venv auto-activation
# ----------------------------------------
python_venv() {
    MYVENV=./env
    [[ -d $MYVENV ]] && source $MYVENV/bin/activate >/dev/null 2>&1
    [[ ! -d $MYVENV ]] && deactivate >/dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

# ----------------------------------------
# Prompt, Fuzzy Finder, Atuin, Zoxide, etc.
# ----------------------------------------
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ajb_negligible.toml)"
source <(fzf --zsh)
eval "$(atuin init zsh)"

# ----------------------------------------
# Node, FNM, Pyenv, SDKMAN, etc.
# ----------------------------------------

eval "$(fnm env --use-on-cd --shell zsh)"

# Pyenv
if command -v pyenv >/dev/null 2>&1; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# SDKMAN
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

#Folder structure for zsh
#.
# ├── .zsh
# │   ├── plugins #has zsh-completions, zsh-autosuggestions, fzf.plugin.zsh and fsh
# │   └── .zsh_history
# └── .zshrc
# zsh-completions : https://github.com/zsh-users/zsh-completions
# zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
# fsh: https://github.com/zdharma/fast-syntax-highlighting
# fzf: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/fzf/fzf.plugin.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive matching
zstyle ':completion:*' menu select # Interactive menu selection
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

alias l="eza -lah"
alias n="nvim"
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

export ZSH=$HOME/.zsh
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/kitty"

function countdown() {
    termdown $1 && play -q -n synth 5 sin 100-1000
}

#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function dls(){
    DIR="$*"
    du -shc * | sort -h
}

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -T | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


#zdharma's fast highlighting
source ~/.zsh/plugins/fsh/F-Sy-H.plugin.zsh
# source ~/.zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh

#zsh-users' autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#zsh-users' completion plugin
# fpath=($ZSH/plugins/zsh-completions/src $fpath)

# fpath=(~/.zsh/completion $fpath)

# Additional completion sources
fpath=(
  /usr/share/zsh/site-functions
  /usr/share/zsh/functions/Completion
  $fpath
)

autoload -U compinit
compinit

python_venv() {
  MYVENV=./env
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv

export NODE_OPTIONS="--disable-warning=ExperimentalWarning"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ajb_negligible.toml)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(atuin init zsh)"

# pnpm
export PNPM_HOME="/home/alan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$HOME/Applications/
export PATH=$PATH:$HOME/dotfiles/Scripts/
. "/home/alan/.deno/env"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

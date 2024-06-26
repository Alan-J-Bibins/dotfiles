#Folder structure for zsh
#.
# ├── .zsh
# │   ├── plugins #has zsh-completions, zsh-autosuggestions, fzf.plugin.zsh and fsh
# │   └── .zsh_history
# └── .zshrc

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

alias l="eza -lah"
alias n="nvim"
alias nf="nvim ./"
alias ls="eza"
alias gpus='lspci -k | grep -A 2 -E "(VGA|3D)"'
alias clera="clear"

alias q="yay -Qi"
alias i="yay -S"
alias s='yay -Ss'

alias lg='lazygit'
alias reloadwaybar='killall -SIGUSR2 waybar'
alias tsl='sudo -E timeshift-launcher'
alias ff='clear && fastfetch'
export ZSH=$HOME/.zsh
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/kitty"

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

#zsh-users' autosuggestion
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

#zsh-users' completion plugin
fpath=($ZSH/plugins/zsh-completions/src $fpath)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/negligible.omp.json)"

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

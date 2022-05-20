# ---------------------
# Environment Variables
# ---------------------
export LANG=ja_JP.UTF-8
export FZF_COMPLETION_TRIGGER='++'
export FZF_COMPLETION_OPTS='--border --info=inline'
export PATH=$PATH:$HOME/go/bin
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"

# ------------------
# Variables, Options
# ------------------
# 履歴管理
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=10000
HISTORY_IGNORE="(ls|pwd|cd ..)"

setopt auto_cd		    # easy move directory
setopt no_correctall	# disable correct
setopt print_eight_bit
setopt auto_pushd
setopt share_history

# ---------
# Functions
# ---------
function chpwd() { ls }	# auto ls

# -------
# Aliases
# -------
alias la='ls -la'
alias g='git'
alias t='tmux'
alias ta='tmux a'
alias tk='tmux kill-session'

# ----------
# Initialize
# ----------

autoload -U compinit && compinit    # load and execute compinit

if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# -------
# Plugins
# -------
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting

# ------------
# Key Bindings
# ------------
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

if [ -f $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh ]; then
    . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
fi

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
fi

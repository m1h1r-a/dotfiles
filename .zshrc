# ===================================
#   Zsh Configuration File (.zshrc)
# ===================================

## -----------------------------
##  Load Zinit Plugin Manager
## -----------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

## -----------------------------
##  Load Essential Plugins
## -----------------------------
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## -----------------------------
##  History Configuration
## -----------------------------
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory         # Append history instead of overwriting it
setopt sharehistory          # Share history across all sessions
setopt hist_ignore_space     # Ignore commands that start with a space
setopt hist_ignore_all_dups  # Remove old duplicate entries when a new entry is added
setopt hist_save_no_dups     # Do not save duplicate commands in history
setopt hist_ignore_dups      # Ignore duplicates when searching history
setopt hist_find_no_dups     # Do not display duplicates in history search

## -----------------------------
##  Load System-Wide Zsh Config
## -----------------------------
if [ -f /etc/zshrc ]; then
    source /etc/zshrc
fi

## -----------------------------
##  Load Powerlevel10k
## -----------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zinit ice depth=1
zinit load romkatv/powerlevel10k

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

## -----------------------------
##  Set User PATH
## -----------------------------
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

## -----------------------------
##  Enable Zsh Completion
## -----------------------------
autoload -Uz compinit && compinit

zinit cdreplay -q

## -----------------------------
##  Auto-Source Extra Configs
## -----------------------------
if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/*; do
        [ -f "$rc" ] && source "$rc"
    done
fi

## -----------------------------
##  Ranger Function (cd on exit)
## -----------------------------
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

## -----------------------------
##  Default Editor
## -----------------------------
export EDITOR=nvim

## -----------------------------
##  Aliases
## -----------------------------
# System & Utility Aliases
alias windows='sudo grub-reboot 4 && reboot'
alias files='xdg-open .'
alias history='history | fzf'

# Clear Aliases (Fix Common Mistakes)
alias clea='clear'
alias celar='clear'
alias cleaer='clear'
alias clar='clear'
alias cleare='clear'
alias claer='clear'
alias clera='clear'
alias lcea='clear'
alias c='clear'
alias clae='clear'
alias cleaer='clear'
alias cear='clear'
alias lea='clear'
alias cd='z'

# File Listing (Better `ls`)
alias ls='exa'

# Ranger (Auto-clear after exit)
alias ranger='ranger "$@"; clear'

## -----------------------------
##  Enable FZF Integration
## -----------------------------
[[ -f /usr/share/fzf/shell/completion.zsh ]] && source /usr/share/fzf/shell/completion.zsh
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
eval "$(fzf --zsh)"

## -----------------------------
##  Zoxide Integration
## -----------------------------
eval "$(zoxide init zsh)"

## -----------------------------
##  Keybindings
## -----------------------------
bindkey -e
bindkey '^j' autosuggest-accept  # Ctrl+J to accept suggestion
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## -----------------------------
##  Completion & FZF Tab Styles
## -----------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

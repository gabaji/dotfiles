# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# these dotfiles come from my personal config on github. github.com/gabaji/dotfiles
source $HOME/dotfiles/zsh/path.zsh
source $HOME/Ayuxh-config/amazon.zsh
source $HOME/dotfiles/zsh/git-alias.zsh
source $HOME/dotfiles/zsh/plugins.zsh
source $HOME/dotfiles/zsh/alias.zsh

# code.amazon.com/packages/Ayuxh-config

ZSH_DISABLE_COMPFIX=true


export PATH=$PATH:/Users/ayuxh/.toolbox/bin:/Users/ayuxh/.cargo/bin:/Users/ayuxh/.local/bin

eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(starship init zsh)"
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
alias cd="z"
alias kssh="kitty +kitten ssh"
alias e=emacs
alias gn="open -a \"Geany\""
alias nv="nvim"

alias cdd="zi"
alias xcp='~/.scripts/cpp_compile'
alias dbg='~/.scripts/cpp_debug'
export FZF_COMPLETION_TRIGGER='\\'


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
zstyle ':completion:*' menu select
zstyle ':autocomplete:*' min-input 1

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYTHONPATH="/Users/ayuxh/workplace/PayPolicyBuildTools/src/PayPolicyBuildTool"

export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"

# automatically attach to a tmux session while ssh 
function tssh () {/usr/bin/ssh -t "$@" "tmux attach || tmux new";}

# space key expands alias
# function expand-alias() {
# 	zle _expand_alias
# 	zle self-insert
# }
# zle -N expand-alias
# bindkey -M main ' ' expand-alias

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

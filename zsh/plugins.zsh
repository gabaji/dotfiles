[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-syntax-highlighting"
# plug "jeffreytse/zsh-vi-mode"
# plug "unixorn/fzf-zsh-plugin"
plug "marlonrichert/zsh-autocomplete"
plug "zsh-users/zsh-autosuggestions"
plug "Aloxaf/fzf-tab"

# source /Users/ayuxh/.local/share/zap/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source /Users/ayuxh/.local/share/zap/plugins/fzf-tab/fzf-tab.plugin.zsh
enable-fzf-tab

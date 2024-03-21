# source ~/.config/zsh/.zshrc
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

eval "$(zoxide init zsh)"
source /Users/rkabrick/.config/zsh/plugins.zsh
source /Users/rkabrick/.config/zsh/aliases.zsh
source /Users/rkabrick/.config/zsh/exports.zsh
source /Users/rkabrick/.config/zsh/keymaps.zsh


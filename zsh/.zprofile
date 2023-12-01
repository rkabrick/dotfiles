export CFG=$HOME/.config
export ZDOTDIR=$CFG/zsh
source $ZDOTDIR/.zshrc

[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}


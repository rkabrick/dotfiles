export CFG=$HOME/.config
export ZDOTDIR=$CFG/zsh
source $ZDOTDIR/.zshrc

# if [ -z "$TMUX" ]; then
#     # Try to attach to an existing session
#     tmux attach -t default || {
#         # If no session named "default" exists, create it
#         exec tmux new-session -s default
#     }
#     exit
# fi
#

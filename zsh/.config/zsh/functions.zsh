alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-brick="NVIM_APPNAME=brickvim nvim"
function nvims() {
  items=("default" "kickstart" "LazyVim" "brickvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="LazyVim"
  fi
  NVIM_APPNAME=$config nvim $@
}


# ~/.config/zsh/aliases.zsh

alias cm='cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=1'
alias mkji='make -j install'
alias mkj='make -j'
alias mkbld='mkdir build; cd build'
alias g='lazygit'
alias ta='task add'
alias rmcm='rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake Makefile'
alias yss='yabai --start-service'
alias yrs='yabai --restart-service'
alias ySs='yabai --stop-service'
alias ninja-errors='ninja 2>&1 | grep -i "error:" --color=auto'
alias ghooks='cd "$(git rev-parse --show-toplevel)" && git config core.hooksPath .githooks'
alias cdg='cd "$(git rev-parse --show-toplevel)"'
alias n='notes'
alias ssh='TERM=xterm-256color ssh'

# Example function with zoxide + fzf
zf() {
  local dir
  dir="$(zoxide query -l | fzf --height 40% --reverse)"
  [[ -n "$dir" ]] && cd -- "$dir" || return
}

# RISC-V helper aliases
rv-readelf() {
    local rvcc_readelf=${RVCC/gcc/readelf}
    "$rvcc_readelf" "$@"
}

rv-objdump() {
    local rvcc_objdump=${RVCC/gcc/objdump}
    "$rvcc_objdump" "$@"
}

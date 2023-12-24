export EDITOR=nvim

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export FZF_DEFAULT_OPTS="
  --color=bg:#26283F,fg:#c0caf5,hl:#7aa2f7

  --color=bg+:#353A59,fg+:#c0caf5,hl+:#bb9af7
  --color=info:#7dcfff,prompt:#7dcfff,pointer:#ff007c
  --color=marker:#9ece6a,spinner:#7dcfff,header:#444b6a
"
export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export TASKRC=~/.config/task/.taskrc
export TASKDATA=~/.config/task

# RISC-V
export RISCV="$HOME/.local/opt/riscv"
export RVCC="$RISCV/bin/riscv64-unknown-elf-gcc-12.2.0"
export RVCXX="$RISCV/bin/riscv64-unknown-elf-g++-12.2.0"


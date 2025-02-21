# ~/.config/zsh/exports.zsh

export EDITOR=nvim

# PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$HOME/.local/bin/scripts:$HOME/.local/scripts:/usr/local/scripts:$PATH"

# FZF colors
export FZF_DEFAULT_OPTS="
  --color=bg:#26283F,fg:#c0caf5,hl:#7aa2f7
  --color=bg+:#353A59,fg+:#c0caf5,hl+:#bb9af7
  --color=info:#7dcfff,prompt:#7dcfff,pointer:#ff007c
  --color=marker:#9ece6a,spinner:#7dcfff,header:#444b6a
"

# WezTerm
export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Taskwarrior
export TASKRC="$HOME/.config/task/.taskrc"
export TASKDATA="$HOME/.config/task"

# RISC-V
export RISCV="/opt/homebrew"
export RVCC="riscv64-unknown-elf-gcc"
export RVCXX="riscv64-unknown-elf-g++"
export RVOBJDUMP="riscv64-unknown-elf-objdump"

# Ansible
export ANSIBLE_CONFIG="$HOME/.config/ansible/ansible.cfg"

# Cargo
export CARGO_INSTALL_ROOT="$HOME/.local"

# Initialize FZF (or remove if you prefer to do this in plugins.zsh)
eval "$(fzf --zsh)"

# -- keymaps.zsh

# Allow zsh-vim-mode to still use ctrl-a / ctrl-e to navigate to the beginning-of-line and end-of-line, respectively
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# bind ctrl-f to tms command
bindkey -M viins '^F' tms
bindkey -M vicmd '^F' tms
# Create a function
function call-tms() {
    tms
}

function call-tms() {
    BUFFER="tms"  # Set the command line to 'tms'
    zle accept-line  # Execute the command as if Enter was pressed
}
zle -N call-tms
bindkey -M viins '^F' call-tms
bindkey -M vicmd '^F' call-tms

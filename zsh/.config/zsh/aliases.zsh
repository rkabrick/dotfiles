alias mkji='make -j install'
alias mkj='make -j'
alias mkbld='mkdir build; cd build'
alias g='lazygit'
alias ta='task add'
alias rmcm='rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake Makefile' # Remvoe CMake related files

alias n='notes'

#bettercp() {
#    local args=("$@")
#    local last_index=$(($#-1))
#
#    # Check each argument except the last (the destination)
#    for i in $(seq 1 $last_index); do
#        if [[ -d ${args[$i]} && ! " ${args[*]} " =~ " -r " ]]; then
#            echo -n "${args[$i]} is a directory, did you mean to pass -r? (y/n) "
#            read -r REPLY
#
#            if [[ $REPLY =~ ^[Yy]$ ]]; then
#                # Add the -r flag and rerun the command
#                command cp -r "$@"
#                return $?
#            else
#                echo "cp command aborted."
#                return 1
#            fi
#        fi
#    done
#
#    # If all checks pass, execute cp with the original arguments
#    command cp "$@"
#}
#
#alias cp=bettercp

alias ssh='TERM=xterm-256color ssh'
# Function to integrate zoxide with fzf
function zf() {
    # Use zoxide query to list directories and pipe them to fzf
    local dir="$(zoxide query -l | fzf --height 40% --reverse)"

    # If a directory was selected, cd to it
    if [ -n "$dir" ]; then
        cd -- "$dir" || return
    fi
}

rv-readelf() {
    local rvcc_readelf=${RVCC/gcc/readelf}
    $rvcc_readelf "$@"
}

rv-objdump() {
    local rvcc_objdump=${RVCC/gcc/objdump}
    $rvcc_objdump "$@"
}

# Alias for cmake that first checks if were in a build directory
function cmake_build_check() {
    # Check if the current directory is named 'build'
    if [[ "$(basename $PWD)" != "build" ]]; then
        echo "Not so fast, you 10X dev, you! You're not in a 'build' directory. Are you sure you want to run cmake here? (y/n)"
        read -r response
        if [[ $response =~ ^[Yy]$ ]]; then
            echo "Alright, smart guy. Good luck breaking shit. Running cmake..."
            cmake "$@"
        else
            echo "Wise choice. Aborted."
        fi
    else
        # Just run cmake if we're already in a 'build' directory
        cmake "$@"
    fi
}

# Alias the function to 'cmake'
alias cm=cmake_build_check
nv () { nvim }
bnv () { NVIM_APPNAME="brickvim" nvim $@}
# alias nvim-brick="NVIM_APPNAME=brickvim nvim"

alias mkji='make -j install'
alias mkj='make -j'
alias mkbld='mkdir build; cd build'
alias g='lazygit'
alias ta='task add'
alias rmcm='rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake Makefile' # Remvoe CMake related files


bettercp() {
    local args=("$@")
    local last_index=$(($#-1))

    # Check each argument except the last (the destination)
    for i in $(seq 1 $last_index); do
        if [[ -d ${args[$i]} && ! " ${args[*]} " =~ " -r " ]]; then
            echo -n "${args[$i]} is a directory, did you mean to pass -r? (y/n) "
            read -r REPLY

            if [[ $REPLY =~ ^[Yy]$ ]]; then
                # Add the -r flag and rerun the command
                command cp -r "$@"
                return $?
            else
                echo "cp command aborted."
                return 1
            fi
        fi
    done

    # If all checks pass, execute cp with the original arguments
    command cp "$@"
}

alias cp=bettercp


rv-readelf() {
    local rvcc_readelf=${RVCC/gcc/readelf}
    $rvcc_readelf "$@"
}

rv-objdump() {
    local rvcc_objdump=${RVCC/gcc/objdump}
    $rvcc_objdump "$@"
}


alias mkji='make -j install'
alias mkj='make -j'
alias mkbld='mkdir build; cd build'
alias g='lazygit'
alias ta='task add'

rv-readelf() {
    local rvcc_readelf=${RVCC/gcc/readelf}
    $rvcc_readelf "$@"
}

rv-objdump() {
    local rvcc_objdump=${RVCC/gcc/objdump}
    $rvcc_objdump "$@"
}


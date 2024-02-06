__chpath_command__list__help() {
    echo 'Usage: chpath list'
    echo
    echo 'list prints all PATH entries to stdout, one per line.'
}

__chpath_command__list() {
    eval "echo \"\$$__CHPATH_VAR\"" | tr ':' "\n"
}

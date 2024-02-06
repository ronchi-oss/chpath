__chpath_command__set() {
    if test -z "$1"; then
        echo 'error: required argument <var-name> must be provided.' >&2
        exit 1
    fi
    export "$1"="$2"
}

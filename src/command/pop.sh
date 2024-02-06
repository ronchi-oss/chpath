__chpath_command__pop__help() {
    echo 'Usage: chpath pop <count>'
    echo
    echo 'pop removes the top <count> items from PATH.'
}

__chpath_command__pop() {
    count="${1:-1}"
    if test "$( ( echo "$count" | tr -d '[:digit:]' ) | wc -c )" -gt 1; then
        echo 'error: <count> must be a digit.' >&2
        return 1
    fi
    length="$(__chpath_command__list | wc -l)"
    new_length="$((length - count))"
    test "$new_length" -lt 0 && new_length=0
    items="$(__chpath_command__list | tail -n "$new_length")"
    new_path=''
    for item in $items; do
        new_path="$new_path:$item"
    done
    __chpath_command__set "$__CHPATH_VAR" "${new_path#:}"
}

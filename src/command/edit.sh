__chpath_command__edit__help() {
    echo 'Usage: chpath edit'
    echo
    echo 'edit allows interactive editing of the PATH entries using EDITOR.'
}

__chpath_command__edit() {
    if test -z "$EDITOR"; then
        echo 'error: EDITOR must be defined.' >&2
        return 1
    fi
    tmp=$(mktemp) ; trap 'rm $tmp' EXIT
    __chpath_command__list > "$tmp"
    "$EDITOR" "$tmp" < /dev/tty
    new_path=''
    while IFS= read -r item; do
        new_path="$new_path:$item"
    done < "$tmp"
    __chpath_command__set "$__CHPATH_VAR" "${new_path#:}"
}

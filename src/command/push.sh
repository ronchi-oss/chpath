__chpath_command__push__help() {
    echo 'Usage: chpath push <item-list>'
    echo
    echo 'push iterates over the list of given items and prepends them to PATH.'
}

__chpath_command__push() {
    items="${*:?'error: missing argument <item-list>'}" || return 1
    eval "new_path=\"\$$__CHPATH_VAR\""
    for item in $items; do
        new_path="$item:$new_path"
    done
    __chpath_command__set "$__CHPATH_VAR" "${new_path%:}"
}

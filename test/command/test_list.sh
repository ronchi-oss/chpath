test_command__list__lists_zero_length_var() {
    export FOO=''
    test '' = "$(printf '%s' "$(chpath -n FOO list)")"
}

test_command__list__lists_many_items() {
    export FOO='a:b'
    test "$(echo a ; echo b)" = "$(chpath -n FOO list)"
}

test_command__list__lists_path_by_default() {
    export PATH="a:b:$PATH"
    test "$(echo a ; echo b)" = "$(chpath list | head -n 2)"
}

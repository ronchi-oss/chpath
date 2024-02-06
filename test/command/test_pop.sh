test_command__pop__pops_zero_length_var() {
    FOO=''
    chpath -n FOO pop
    test 0 -eq $?
}

test_command__pop__pops_one_item_by_default() {
    FOO='hello:world'
    chpath -n FOO pop
    test 'world' = "$FOO"
}

test_command__pop__pops_many_items() {
    FOO='a:b:c:d'
    chpath -n FOO pop 2
    test 'c:d' = "$FOO"
}

test_command__pop__pops_all_items() {
    FOO='a:b:c:d'
    chpath -n FOO pop 4
    test '' = "$FOO"
}

test_command__pop__pops_all_but_one() {
    FOO='a:b:c:d'
    chpath -n FOO pop 3
    test 'd' = "$FOO"
}

test_command__pop__pops_from_path_by_default() {
    _path="$PATH"
    PATH="hello:world:$PATH"
    chpath pop 2
    test "$_path" = "$PATH"
}

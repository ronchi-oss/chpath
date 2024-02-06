test_command__push__pushes_one_to_zero_length_var() {
    FOO=''
    chpath -n FOO push 'a'
    test 'a' = "$FOO"
}

test_command__push__pushes_many_to_zero_length_var() {
    FOO=''
    chpath -n FOO push c b a
    test 'a:b:c' = "$FOO"
}

test_command__push__pushes_one() {
    FOO='b:c:d'
    chpath -n FOO push 'a'
    test 'a:b:c:d' = "$FOO"
}

test_command__push__pushes_many() {
    FOO='d:e:f'
    chpath -n FOO push c b a
    test 'a:b:c:d:e:f' = "$FOO"
}

test_command__push__pushes_to_path_by_default() {
    _path="$PATH"
    chpath push world hello
    test "hello:world:$_path" = "$PATH"
}

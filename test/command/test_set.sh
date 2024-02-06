test_set__exports_variable_with_custom_name() {
    __chpath_command__set -n FOO 'hello:world'
    test 'hello:world' = "$FOO"
}

test_set__exports_path_by_default() {
    __chpath_command__set "/opt/homebrew/bin:$PATH"
    test '/opt/homebrew/bin' = "${PATH%%:*}"
}

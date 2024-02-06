test_command__set__exports_correctly() {
    __chpath_command__set FOO 'hello:world'
    test 'hello:world' = "$FOO"
}

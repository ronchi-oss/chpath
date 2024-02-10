__chpath_completion__suggest_commands() {
    for command in edit list pop push; do
        echo "$command"
    done
}

__chpath_completion__suggest_commands_with_help() {
    __chpath_completion__suggest_commands
}

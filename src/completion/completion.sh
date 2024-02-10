__chpath_completion__suggest_commands() {
    for command in edit list pop push; do
        echo "$command"
    done
}

__chpath_completion__suggest_commands_with_help() {
    __chpath_completion__suggest_commands \
        | while read -r command; do
              line="$(type "__chpath_command__${command}__help" 2>/dev/null | head -n 1)"
              if test "${line##* }" != 'function'; then
                  continue
              fi
              echo "$command"
          done
}

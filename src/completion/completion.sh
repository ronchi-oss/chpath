__chpath_completion__suggest_commands() {
    chpath help \
        | grep '^\t' \
        | cut -f 2 \
        | while read -r command _; do
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

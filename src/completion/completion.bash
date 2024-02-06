__chpath_completion__bash() {
    test "$1" != chpath && return 1
    mapfile -t COMPREPLY < <(
        case "$3" in
            chpath)
                __chpath_completion__suggest_commands \
                    | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
            help)
                __chpath_completion__suggest_commands_with_help \
                    | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
        esac
    )
}

complete -F __chpath_completion__bash chpath

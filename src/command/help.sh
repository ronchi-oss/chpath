__chpath_command__help() {
    exit_status=0
    if test "$1" -gt 0; then
        exec >&2
        exit_status="$1"
    fi
    case "$2" in
        edit|list|pop|push|version) "__chpath_command__${2}__help" ;;
        *)
            if test -n "$2"; then
                echo "chpath help $2: no usage information available." >&2
                return 1
            fi
            echo 'Usage: chpath <command> [arguments]'
            echo
            echo 'Available commands:'
            echo
            printf '\t%-7s %s\n' 'edit'   'Edit PATH entries with EDITOR'
            printf '\t%-7s %s\n' 'list'   'Print PATH entries to stdout'
            printf '\t%-7s %s\n' 'pop'    'Pop <count> entries from PATH'
            printf '\t%-7s %s\n' 'push'   'Push <entries> to PATH'
            echo
            echo 'Run "chpath help <command>" for further information about a command.'
            ;;
    esac
    return "$exit_status"
}

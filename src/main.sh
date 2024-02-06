chpath() {
    __CHPATH_VAR="PATH"
    OPTIND=1
    while getopts n: option "$@"; do
        case "$option" in
            n) __CHPATH_VAR="$OPTARG" ;;
            *) ;;
        esac
    done
    shift $((OPTIND - 1))

    case "$1" in
        -h) shift ; __chpath_command__help 1 ;;
        help) shift ; __chpath_command__help 0 "$1" ;;
        edit|list|pop|push|version)
            command="$1" ; shift
            "__chpath_command__${command}" "$@"
            ;;
        *)
            if test -n "$1"; then
                echo "chpath $1: unknown command"
                echo "Run 'chpath help' for usage."
            else
                __chpath_command__help 1
            fi
    esac
}


__chpath_command__set() {
    name="PATH"
    OPTIND=1
    while getopts n: option "$@"; do
        case "$option" in
            n) name="$OPTARG" ;;
            *) ;;
        esac
    done
    shift $((OPTIND - 1))
    export "$name"="$1"
}

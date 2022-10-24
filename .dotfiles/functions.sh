#!/usr/bin/env bash
# all functions should work for both bash and zsh and on standard ubuntu and mac
# machines.

is_installed() { command -v "$1" &>/dev/null; }

alert() {
    local prev_return_code=$?
    local header
    if [ "$prev_return_code" = 0 ]; then header="terminal"; else
        header="error"
    fi
    local msg=""
    if [ "$#" -gt 0 ]; then
        msg="$*"
    else
        msg="$(
            history | tail -n1 | sed -e 's/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'
        )"
    fi
    if is_installed notify-send; then
        notify-send -i "$header" "$msg"
    elif is_installed osascript; then
        local cmd
        cmd="$(
            printf 'display notification "%s" with title "%s"' \
                "${msg//\"/\\\"}" \
                "$header"
        )"
        osascript -e "$cmd"
    fi
}

tailscale_ip() {
    ### tailscale_ip [QUERY]
    ### search tailscale status by node name
    if [ -n "${1:-}" ]; then
        tailscale status | grep "$1" | awk '{ print $1 }'
    else
        tailscale status | fzf | awk '{ print $1 }'
    fi
}

into() {
    local target_ip
    local username
    local query
    while [ -n "${1:-}" ]; do
        case "$1" in
        -h | --help) echo "into [-h|--help] [[-u] USER | [--user[=]]USER] [QUERY]" && exit 0 ;;
        -u | --user)
            shift
            username=$1
            shift
            ;;
        --user=*)
            username="${1%=*}"
            shift
            ;;
        *)
            query="$1"
            shift
            ;;
        esac
    done
    if test -z "$username"; then username="$(whoami)"; fi
    target_ip="$(tailscale_ip "$query")"
    ssh "${username}@${target_ip}"
}

weather() { curl wttr.in; }

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

into() {
    local target_ip
    if [ -n "${1:-}" ]; then
        target_ip="$(tailscale status | grep "$1" | awk '{ print $1 }')"
    else
        target_ip="$(tailscale status |    fzf    | awk '{ print $1 }')"
    fi
    ssh "$target_ip"
}

pretty_path() { echo "${PATH//:/\n}"; }
iso_date() { date '+%Y-%m-%dT%H:%M:%S%z'; }
weather() { curl wttr.in; }

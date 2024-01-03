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

clone_into() {
  clone_into_dry_run=false
  clone_into_repo_url=""
  clone_into_target_dir=""
  while [ -n "${1:-}" ]; do
    case "$1" in
      -h|--help)
        echo "USAGE: clone_into [-h|--help] [-d|--dry-run] REPO_URL [TARGET_DIR]"
        echo "clone and cd into a git repo in one go"
        return 0
        ;;
      -d|--dry-run) clone_into_dry_run=true; shift ;;
      *)
        if [ -z "${clone_into_repo_url:-}" ]; then clone_into_repo_url="$1"; shift;
        elif [ -z "${clone_into_target_dir:-}" ]; then clone_into_target_dir="$1"; shift;
        else fail "unexpected argument: $1"
        fi
      ;;
    esac
  done
  if [ -z "${clone_into_repo_url:-}" ]; then
    echo "missing argument: REPO_URL" >&2
    return 1
  fi
  if [ -z "${clone_into_target_dir:-}" ]; then
    clone_into_target_dir="$(basename "$clone_into_repo_url" .git)"
  fi
  clone_into_cmd="git clone $clone_into_repo_url $clone_into_target_dir && cd $clone_into_target_dir"
  if [ "$clone_into_dry_run" = true ]; then
    echo "$clone_into_cmd"
  else
    eval "$clone_into_cmd"
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

#!/bin/sh
### USAGE: $0 [-h|--help] PORT_NUMBERS...
### Check if any of the given PORT_NUMBERS are already in use.
usage() { grep '^###' "$0"  | sed "s/^### //g; s/^###//g; s#\\\$0#$0#g;"; }

PORT_NUMBERS=""
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help) usage && exit 0;;
    0|1|2|3|4|5|6|7|8|9)
      if [ -n "${PORT_NUMBERS:-}" ]; then 
        PORT_NUMBERS="$PORT_NUMBERS|"
      fi
      PORT_NUMBERS="${PORT_NUMBERS}$1"
      shift
      ;;
    *) usage >&2 && exit 1;;
  esac
done
if command -v netstat > /dev/null; then
  netstat -atuln | grep -E "$PORT_NUMBERS" && exit 1
elif command -v ss > /dev/null; then
  ss -atuln | grep -E "$PORT_NUMBERS" && exit 1
else
  echo "Neither 'netstat' nor 'ss' is available." >&2
  exit 1
fi

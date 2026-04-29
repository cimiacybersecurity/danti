#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# DANTI logging library
#
# Console logs:
#   - human-readable
#
# File logs:
#   - JSON Lines
#
# Configuration variables expected:
#   DANTI_LOG_LEVEL="INFO"
#   DANTI_LOG_CONSOLE="true"
#   DANTI_LOG_FILE_ENABLED="false"
#   DANTI_LOG_FILE_PATH="var/logs/danti.jsonl"
#   DANTI_LOG_MODULE="danti"
#   DANTI_LOG_DEVICE="unknown"
#
# Log levels:
#   DEBUG includes INFO, WARN, ERROR, FATAL
#   INFO  includes WARN, ERROR, FATAL
#   WARN  includes ERROR, FATAL
#   ERROR includes FATAL
#   FATAL exits immediately
# -----------------------------------------------------------------------------

DANTI_LOG_LEVEL="${DANTI_LOG_LEVEL:-INFO}"
DANTI_LOG_CONSOLE="${DANTI_LOG_CONSOLE:-true}"
DANTI_LOG_FILE_ENABLED="${DANTI_LOG_FILE_ENABLED:-false}"
DANTI_LOG_FILE_PATH="${DANTI_LOG_FILE_PATH:-var/logs/danti.jsonl}"
DANTI_LOG_MODULE="${DANTI_LOG_MODULE:-danti}"
DANTI_LOG_DEVICE="${DANTI_LOG_DEVICE:-unknown}"

_log_level_value() {
  case "$1" in
    DEBUG) echo 10 ;;
    INFO)  echo 20 ;;
    WARN)  echo 30 ;;
    ERROR) echo 40 ;;
    FATAL) echo 50 ;;
    *)     echo 20 ;;
  esac
}

_log_timestamp() {
  date +"%Y-%m-%dT%H:%M:%S%z"
}

_json_escape() {
  local input="${1:-}"
  input="${input//\\/\\\\}"
  input="${input//\"/\\\"}"
  input="${input//$'\n'/\\n}"
  input="${input//$'\r'/\\r}"
  input="${input//$'\t'/\\t}"
  printf '%s' "$input"
}

_should_log() {
  local level="$1"
  local current wanted

  current="$(_log_level_value "$DANTI_LOG_LEVEL")"
  wanted="$(_log_level_value "$level")"

  [ "$wanted" -ge "$current" ]
}

log_msg() {
  local level="$1"
  local message="$2"
  local ts escaped_message escaped_module escaped_device

  level="$(printf '%s' "$level" | tr '[:lower:]' '[:upper:]')"

  if ! _should_log "$level"; then
    return 0
  fi

  ts="$(_log_timestamp)"

  if [ "$DANTI_LOG_CONSOLE" = "true" ]; then
    printf '%s [%s] [%s] [%s] %s\n' \
      "$ts" "$level" "$DANTI_LOG_MODULE" "$DANTI_LOG_DEVICE" "$message"
  fi

  if [ "$DANTI_LOG_FILE_ENABLED" = "true" ]; then
    mkdir -p "$(dirname "$DANTI_LOG_FILE_PATH")"

    escaped_message="$(_json_escape "$message")"
    escaped_module="$(_json_escape "$DANTI_LOG_MODULE")"
    escaped_device="$(_json_escape "$DANTI_LOG_DEVICE")"

    printf '{"ts":"%s","level":"%s","module":"%s","device":"%s","message":"%s"}\n' \
      "$ts" "$level" "$escaped_module" "$escaped_device" "$escaped_message" \
      >> "$DANTI_LOG_FILE_PATH"
  fi
}

log_debug() { log_msg "DEBUG" "$*"; }
log_info()  { log_msg "INFO"  "$*"; }
log_warn()  { log_msg "WARN"  "$*"; }
log_error() { log_msg "ERROR" "$*"; }

log_fatal() {
  log_msg "FATAL" "$*"
  exit 1
}

prompt_msg() {
  printf '%s\n' "$*" > /dev/tty
}

confirm_prompt() {
  local question="$1"
  local answer

  while true; do
    printf '%s [y/N]: ' "$question" > /dev/tty
    read -r answer < /dev/tty

    case "$answer" in
      y|Y|yes|YES|Yes) return 0 ;;
      n|N|no|NO|No|"") return 1 ;;
      *) printf 'Please answer yes or no.\n' > /dev/tty ;;
    esac
  done
}

#!/usr/bin/env bash
set -euo pipefail

sessions_dir="${CODEX_HOME:-$HOME/.codex}/sessions"
days=30
all=false
header=true

usage() {
  cat <<'USAGE'
Usage: codex-session-task-inventory.sh [options]

Emit a TSV inventory of Codex session files using compact metadata and the
first user task prompt after common wrapper messages.

Options:
  --sessions-dir DIR  Codex sessions directory (default: ~/.codex/sessions)
  --days N            Include files modified in the last N days (default: 30)
  --all               Include all session files under --sessions-dir
  --no-header         Omit the TSV header row
  -h, --help          Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --sessions-dir)
      sessions_dir="${2:?--sessions-dir requires a directory}"
      shift 2
      ;;
    --days)
      days="${2:?--days requires a number}"
      shift 2
      ;;
    --all)
      all=true
      shift
      ;;
    --no-header)
      header=false
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required but was not found on PATH" >&2
  exit 1
fi

if [[ ! -d "$sessions_dir" ]]; then
  echo "sessions directory not found: $sessions_dir" >&2
  exit 1
fi

if [[ ! "$days" =~ ^[0-9]+$ || "$days" -eq 0 ]]; then
  echo "--days must be a positive integer" >&2
  exit 2
fi

if [[ "$header" == true ]]; then
  printf 'date\tthread_source\tagent_role\tproject\tsession_file\ttask_prompt\n'
fi

find_args=("$sessions_dir" -type f -name '*.jsonl')
if [[ "$all" != true ]]; then
  find_args+=(-mtime "-$days")
fi

find "${find_args[@]}" -print0 |
  while IFS= read -r -d '' session_file; do
    jq -s -r '
      def clean:
        gsub("[\r\n\t]"; " ")
        | gsub("  +"; " ")
        | .[0:420];

      def wrapper_message:
        startswith("<environment_context>")
        or startswith("<skill>")
        or startswith("<permissions")
        or startswith("# AGENTS.md instructions")
        or startswith("<turn_aborted>");

      (map(select(.type == "session_meta"))[0].payload) as $meta |
      ([.[] |
        select(.type == "response_item"
          and .payload.type == "message"
          and .payload.role == "user") |
        .payload.content[]?.text |
        select(type == "string") |
        select((wrapper_message) | not)
      ][0] // "") as $task |
      [
        ($meta.timestamp[0:10] // ""),
        ($meta.thread_source // "main"),
        ($meta.agent_role // ""),
        ($meta.cwd // "" | split("/")[-1]),
        (input_filename | split("/")[-1]),
        ($task | clean)
      ] | @tsv
    ' "$session_file"
  done

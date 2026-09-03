#!/usr/bin/env bash
#
# Vellumkeep installer and health check.
#
#   ./setup.sh install <target>   Copy the document pack into a project
#   ./setup.sh check <target>     Report how much of the pack is filled in
#
# No dependencies beyond bash and coreutils. Safe to run more than once.

set -euo pipefail

VERSION="1.0.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$SCRIPT_DIR/template"

DOCS=(PROJECT.md ARCHITECTURE.md DECISIONS.md ROADMAP.md OPERATIONS.md CONTRIBUTING.md CLAUDE.md README.md)

# Colour, unless the terminal cannot take it or the user opted out.
if [[ -t 1 && -z "${NO_COLOR:-}" && "${TERM:-dumb}" != "dumb" ]]; then
  B=$'\033[1m'; DIM=$'\033[2m'; R=$'\033[0m'
  CYAN=$'\033[38;5;44m'; AMBER=$'\033[38;5;214m'
  GREEN=$'\033[38;5;77m'; RED=$'\033[38;5;203m'; GREY=$'\033[38;5;245m'
else
  B=""; DIM=""; R=""; CYAN=""; AMBER=""; GREEN=""; RED=""; GREY=""
fi

banner() {
  printf '\n'
  printf '%s' "$CYAN"
  cat <<'ART'
██╗   ██╗███████╗██╗     ██╗     ██╗   ██╗███╗   ███╗
██║   ██║██╔════╝██║     ██║     ██║   ██║████╗ ████║
██║   ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║
╚██╗ ██╔╝██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║
 ╚████╔╝ ███████╗███████╗███████╗╚██████╔╝██║ ╚═╝ ██║
  ╚═══╝  ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝
ART
  printf '%s' "$AMBER"
  cat <<'ART'
                     ██╗  ██╗███████╗███████╗██████╗
                     ██║ ██╔╝██╔════╝██╔════╝██╔══██╗
                     █████╔╝ █████╗  █████╗  ██████╔╝
                     ██╔═██╗ ██╔══╝  ██╔══╝  ██╔═══╝
                     ██║  ██╗███████╗███████╗██║
                     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
ART
  printf '%s' "$R"
  printf '%s  Eight documents. One shared memory.%s  %sv%s%s\n\n' \
    "$GREY" "$R" "$DIM" "$VERSION" "$R"
}

rule() { printf '%s%s%s\n' "$GREY" "────────────────────────────────────────────────────────" "$R"; }
tick() { printf '  %s✔%s %s\n' "$GREEN" "$R" "$1"; }
cross() { printf '  %s✘%s %s\n' "$RED" "$R" "$1"; }
info() { printf '  %s•%s %s\n' "$CYAN" "$R" "$1"; }
warn() { printf '  %s!%s %s\n' "$AMBER" "$R" "$1"; }

# bar <filled> <total> <width>
bar() {
  local filled=$1 total=$2 width=$3 i pct on
  if (( total == 0 )); then on=$width; pct=100; else
    on=$(( filled * width / total )); pct=$(( filled * 100 / total ))
  fi
  printf '%s' "$GREEN"
  for ((i = 0; i < on; i++)); do printf '█'; done
  printf '%s' "$GREY"
  for ((i = on; i < width; i++)); do printf '░'; done
  printf '%s %s%3d%%%s' "$R" "$B" "$pct" "$R"
}

usage() {
  banner
  printf '%sUsage%s\n\n' "$B" "$R"
  printf '  ./setup.sh install <target>   Copy the pack into a project\n'
  printf '  ./setup.sh check <target>     Report how much is filled in\n\n'
  printf '%sExamples%s\n\n' "$B" "$R"
  printf '  ./setup.sh install ~/code/my-app/docs\n'
  printf '  ./setup.sh check  ~/code/my-app/docs\n\n'
  printf '%sSet NO_COLOR=1 to disable colour.%s\n\n' "$DIM" "$R"
}

do_install() {
  local target="${1:-}"
  banner
  [[ -n "$target" ]] || { cross "No target directory given."; printf '\n  Try: ./setup.sh install ./docs\n\n'; exit 2; }
  [[ -d "$PACK_DIR" ]] || { cross "Cannot find the template pack at $PACK_DIR"; exit 1; }

  printf '%sInstalling into%s %s\n\n' "$B" "$R" "$target"
  mkdir -p "$target"

  local copied=0 skipped=0
  for doc in "${DOCS[@]}"; do
    if [[ -e "$target/$doc" ]]; then
      warn "$(printf '%-18s already exists, left untouched' "$doc")"
      skipped=$((skipped + 1))
    else
      cp "$PACK_DIR/$doc" "$target/$doc"
      tick "$(printf '%-18s installed' "$doc")"
      copied=$((copied + 1))
    fi
  done

  printf '\n'; rule
  printf '  %s%d installed%s' "$GREEN" "$copied" "$R"
  (( skipped > 0 )) && printf '%s, %d left alone%s' "$GREY" "$skipped" "$R"
  printf '\n'; rule; printf '\n'

  printf '%sNext%s\n\n' "$B" "$R"
  info "Fill in ${B}PROJECT.md${R} first. The other seven lean on it."
  info "Search for {{ to find anything still unfilled."
  info "Check progress:  ./setup.sh check $target"
  printf '\n'
}

do_check() {
  local target="${1:-}"
  banner
  [[ -n "$target" ]] || { cross "No target directory given."; printf '\n  Try: ./setup.sh check ./docs\n\n'; exit 2; }
  [[ -d "$target" ]] || { cross "No such directory: $target"; printf '\n'; exit 1; }

  printf '%sChecking%s %s\n\n' "$B" "$R" "$target"

  local present=0 missing=0 total_ph=0
  for doc in "${DOCS[@]}"; do
    if [[ ! -f "$target/$doc" ]]; then
      cross "$(printf '%-18s missing' "$doc")"
      missing=$((missing + 1))
      continue
    fi
    present=$((present + 1))
    local ph
    # grep exits non-zero when a document has no placeholders left, which
    # pipefail would otherwise treat as a fatal error. Absorb it deliberately.
    ph=$(grep -o '{{' "$target/$doc" 2>/dev/null | wc -l | tr -d ' ' || true)
    [[ -n "$ph" ]] || ph=0
    total_ph=$((total_ph + ph))
    if (( ph == 0 )); then
      tick "$(printf '%-18s complete' "$doc")"
    else
      printf '  %s◐%s %-18s %s%s placeholder(s) left%s\n' "$AMBER" "$R" "$doc" "$GREY" "$ph" "$R"
    fi
  done

  printf '\n'; rule
  printf '  Documents present  '; bar "$present" "${#DOCS[@]}" 24
  printf '   %s%d of %d%s\n' "$GREY" "$present" "${#DOCS[@]}" "$R"
  rule; printf '\n'

  if (( missing == 0 && total_ph == 0 )); then
    printf '  %s%s✔ Pack complete. Nothing left to fill in.%s\n\n' "$B" "$GREEN" "$R"
  elif (( missing > 0 )); then
    warn "$missing document(s) missing. Run: ./setup.sh install $target"
    printf '\n'
  else
    warn "$total_ph placeholder(s) still to fill in across the pack."
    printf '\n'
  fi
}

case "${1:-}" in
  install) shift; do_install "${1:-}" ;;
  check)   shift; do_check "${1:-}" ;;
  -h|--help|help|"") usage ;;
  -v|--version) printf 'vellumkeep %s\n' "$VERSION" ;;
  *) usage; printf '  %sUnknown command: %s%s\n\n' "$RED" "$1" "$R"; exit 2 ;;
esac

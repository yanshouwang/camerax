#!/bin/bash

set -e

targets=(
  "camerax_platform_interface"
  "camerax_android"
  "camerax_ios"
  "camerax"
)

DRY_RUN=false
TARGET=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    *)
      TARGET="$1"
      shift
      ;;
  esac
done

publish() {
  local target=$1
  local dry_run=$2

  if [ "$dry_run" = true ]; then
    echo "Validating $target..."
    flutter pub publish --dry-run --directory="$target"
  else
    echo "Publishing $target..."
    flutter pub publish --directory="$target"
  fi
}

if [ -n "$TARGET" ]; then
  publish "$TARGET" "$DRY_RUN"
else
  for target in "${targets[@]}"; do
    publish "$target" "$DRY_RUN"
  done
fi
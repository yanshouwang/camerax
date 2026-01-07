#!/bin/bash

set -e

targets=(
  "camerax_platform_interface"
  "camerax_android"
  "camerax_ios"
  "camerax"
)

publish() {
  local target=$1
  local version=$(sed -n 's/^version:[[:space:]]*["'\'']*\([^[:space:]''"''\'']*\).*/\1/p' "$target/pubspec.yaml")
  local tag="$target-$version"

  echo "Publishing $target version $version..."
  git tag "$tag"
  git push origin "$tag"
}

if [ -n "$1" ]; then
  publish "$1"
else
  for target in "${targets[@]}"; do
    publish "$target"
  done
fi
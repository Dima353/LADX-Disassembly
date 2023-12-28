#!/usr/bin/env bash
#
# Compare the given files to their reference md5 checksum.
# The SUMFILE is expected to be in the `checksum` format.
#
# Usage:
#   md5sum.sh SUMFILE FILE [, FILE…]

set -eu

# Parse arguments
if [[ "$#" -lt 2 ]]; then
  echo "Invalid number of arguments."
  echo "Usage:"
  echo "  md5sum.sh SUMFILE FILE [, FILE…]"
  exit 1
fi

SUMFILE="$1"
shift

# For each file in argument, check if it's present in the sumfile.
for FILE in "$@"; do
  if grep -q "$FILE" "$SUMFILE"; then
    echo "$FILE is present in '$SUMFILE'"
  else
    echo "'$FILE' is not found in '$SUMFILE'"
  fi
done


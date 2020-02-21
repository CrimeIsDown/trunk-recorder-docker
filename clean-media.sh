#!/bin/bash
set -x

cd "$(dirname "${BASH_SOURCE[0]}")"

EXCLUDE_DIRS="chi_oemc"

for dir in $(find media -mindepth 1 -maxdepth 1 -type d | grep -v $EXCLUDE_DIRS); do
    # Remove files more than 6 hours old
    find $dir -type f -mmin +360 -delete
done

find media -type d -empty -delete

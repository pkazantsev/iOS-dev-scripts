#!/bin/sh

TAGS="TODO:|FIXME:"
echo "Searching ${SRCROOT} for ${TAGS}"
find "${SRCROOT}" \( -path "${SRCROOT}/Pods" -o -path "${SRCROOT}/Carthage" \) -prune -o \( -name "*.h" -or -name "*.m" -or -name "*.swift" \) -print0 \
	| xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$" \
	| perl -p -e "s/($TAGS)/ warning: \$1/"

#!/usr/bin/env sh

if [ -z $1 ]; then
    echo "Error: 1st parameter should be a file path"
    exit
fi

# 1. Split errors to separate blocks
cat $1 | sed 's/\", "/\"\
\
"/g' \
# 2. Replace capital \U with small \u
       | sed 's/\\U/\\u/g' \
# 3. Replace double slash with single
       | sed 's/\\\\/\\/g' \
       | sed 's/\\"/\"/g' \
       | sed 's/\\n/\
/g' \
# 4. Convert character codes to unicode symbols
       | ascii2uni  -a U -q

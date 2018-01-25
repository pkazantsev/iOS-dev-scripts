#!/usr/bin/env sh

if [ -z $1 ]; then
    echo "Error: 1st parameter should be a file path"
    exit
fi

# 1. Split errors to separate blocks
# 2. Replace capital \U with small \u
# 3. Replace double slash with single
# 4. Convert character codes to unicode symbols
cat $1 | sed 's/\", "/\"\
\
"/g' \
       | sed 's/\\U/\\u/g' \
       | sed 's/\\\\/\\/g' \
       | sed 's/\\"/\"/g' \
       | sed 's/\\n/\
/g' \
       | ascii2uni  -a U -q

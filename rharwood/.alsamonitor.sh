#!/bin/sh

# known issues: 
# 1. when vol drops below 10%, digit drop

while true; do
    echo "$(amixer get Master | tail -n1 | awk '{print $4$6}' | tr -d '[]' | sed -e 's/on//g' | sed -e 's/%off/M/g')"
    sleep .1
done

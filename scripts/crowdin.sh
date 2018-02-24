#!/bin/bash

basedir=$(git rev-parse --show-toplevel)
apikey=$(tr -d ' \r\n' < "$basedir/scripts/crowdin.key")
location='app/src/main/res'

if [ -z "$basedir" -o -z "apikey"]; then
    echo 'API key misssing'
    exit 1
fi

if [ -n "$(git status --porcelain $basedir/$location)" ]; then
    echo 'Outstanding chanages:'
    git status --short "$basedir/$localtion"
    exit 1
fi

response=$(curl -sS "https://api.crowdin.com/api/project/leafpic/export?key=$apikey" | grep '<success')
echo $response

if [ -n "$response"]; then

fi


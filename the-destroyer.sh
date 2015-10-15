#!/bin/sh

ENGINE_URL=$(meshblu-util get | jq '.meshblu.messageHooks[0].url' | sed -e 's|"||g')

echo "hitting up $ENGINE_URL"
curl -X POST -H "Content-type: application/json" -d @./trigger-message.json $ENGINE_URL

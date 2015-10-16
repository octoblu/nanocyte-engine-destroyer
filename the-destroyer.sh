#!/bin/sh
ENGINE_URL=$(meshblu-util get | jq '.meshblu.messageHooks[0].url' | sed -e 's|"||g')
ENGINE_PID=$(ps -ef | grep nanocyte-engine-simple | grep node | awk '{print $2}')

jq -s 'setpath([0, "payload", "whatever"]; .[1])' trigger-message.json magic-is-awesome.json | jq '.[0]' > big-message.json
#make a new big message via:
for i in $(seq 1 100); do
  echo "hitting up $ENGINE_URL"
  # kill -USR2 $ENGINE_PID
  curl -X POST -H "Content-type: application/json" -d @./big-message.json  $ENGINE_URL
  # sleep 10
  # kill -USR2 $ENGINE_PID
done;


#find the engine: top -pid $(ps -ef | grep nanocyte-engine-simple | grep node | awk '{print $2}')

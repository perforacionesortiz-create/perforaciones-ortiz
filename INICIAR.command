#!/bin/zsh
cd "$(dirname "$0")"
python3 -m http.server 8061 &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null' EXIT INT TERM
sleep 1
open "http://localhost:8061/index.html?v=61"
wait $SERVER_PID

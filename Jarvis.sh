#!/bin/bash

source config.sh
source commands.sh
source ai.sh
source voice.sh

while true; do
    speak "Listening..."
    user_input=$(listen)

    if handle_commands "$user_input"; then
        continue
    fi

    speak "Processing AI response..."
    get_ai_response "$user_input"
done
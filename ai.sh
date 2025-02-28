#!/bin/bash
source config.sh

get_ai_response() {
    prompt="$1"
    response=$(curl -s -X POST "$OPENAI_API_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
            "model": "gpt-3.5-turbo",
            "messages": [{"role": "system", "content": "You are an AI assistant."},
                         {"role": "user", "content": "'"$prompt"'"}],
            "max_tokens": 100
        }' | jq -r '.choices[0].message.content')

    speak "$response"
}
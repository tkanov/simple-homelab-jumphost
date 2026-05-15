#!/bin/bash

# Run only in interactive SSH sessions
if [[ -z "$SSH_TTY" ]]; then
    exit 0
fi

HOST=$(awk '$1=="Host" && $2!="*" {print $2}' ~/.ssh/config | fzf --prompt="Select server: ")

if [ -n "$HOST" ]; then
    ssh "$HOST"
else
    echo "No host selected. Exiting."
    exit 1
fi

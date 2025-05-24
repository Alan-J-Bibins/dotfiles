#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <program_to_run> [args...]"
    exit 1
fi

PROGRAM="$1"
shift
ARGS="$@"
PID=""

run_program() {
    # Kill the previous instance if running
    if [ -n "$PID" ]; then
        kill "$PID" 2>/dev/null
        wait "$PID" 2>/dev/null
    fi
    # Start the new instance
    "$PROGRAM" $ARGS &
    PID=$!
    echo "Started $PROGRAM with PID $PID"
}

run_program

while true; do
    read -r -n 1 input
    if [[ "$input" == "r" ]]; then
        echo ""
        echo "Restarting..."
        run_program
    elif [[ "$input" == "q" ]]; then
        echo ""
        echo "Quitting..."
        if [ -n "$PID" ]; then
            kill "$PID" 2>/dev/null
            wait "$PID" 2>/dev/null
        fi
        exit 0
    fi
done

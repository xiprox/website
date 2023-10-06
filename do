#!/bin/bash

# Runs code generation. Use: `./do gen` or `./do gen watch`` in project dir.
if [[ $1 == "gen" ]]; then
    if [[ $2 == "watch" ]]; then
        flutter pub run build_runner watch --delete-conflicting-outputs
    else
        flutter pub run build_runner build --delete-conflicting-outputs
    fi
fi

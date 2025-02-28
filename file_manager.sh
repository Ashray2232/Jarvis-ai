#!/bin/bash

open_folder() {
    termux-open "/sdcard/$1"
    speak "Opening folder $1."
}

list_files() {
    files=$(ls "/sdcard/$1" 2>/dev/null)
    speak "Files in $1: $files."
}

read_file() {
    if [[ -f "/sdcard/$1" ]]; then
        content=$(cat "/sdcard/$1")
        speak "The content of $1 is: $content."
    else
        speak "File $1 not found."
    fi
}

write_file() {
    echo "$2" >> "/sdcard/$1"
    speak "Written to $1."
}

delete_file() {
    if [[ -f "/sdcard/$1" ]]; then
        rm "/sdcard/$1"
        speak "File $1 deleted."
    else
        speak "File $1 not found."
    fi
}
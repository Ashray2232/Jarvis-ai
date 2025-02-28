#!/bin/bash

go_home() {
    input keyevent 3
    speak "Returning to home screen."
}

flashlight() {
    termux-torch "$1"
    speak "Flashlight turned $1."
}

open_app() {
    am start -n "$1"
    speak "Opening application."
}

send_message() {
    termux-sms-send -n "$1" "$2"
    speak "Message sent to $1."
}
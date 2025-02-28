#!/bin/bash

speak() {
    termux-tts-speak "$1"
}

listen() {
    termux-speech-to-text
}
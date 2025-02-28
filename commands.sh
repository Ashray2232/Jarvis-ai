#!/bin/bash

# Import other scripts
source system.sh
source file_manager.sh
source ai.sh
source voice.sh

handle_commands() {
    case "$1" in
        "go back to home screen") go_home ;;
        "flash on") flashlight "on" ;;
        "flash off") flashlight "off" ;;
        "enter WhatsApp") open_app "com.whatsapp" ;;
        "send message to "*)
            recipient=$(echo "$1" | cut -d ' ' -f 4)
            message=$(echo "$1" | cut -d ' ' -f 6-)
            send_message "$recipient" "$message"
            ;;
        "open folder "*)
            folder=$(echo "$1" | cut -d ' ' -f 3-)
            open_folder "$folder" ;;
        "list files in "*)
            folder=$(echo "$1" | cut -d ' ' -f 4-)
            list_files "$folder" ;;
        "read file "*)
            file=$(echo "$1" | cut -d ' ' -f 3-)
            read_file "$file" ;;
        "write to file "*)
            file=$(echo "$1" | cut -d ' ' -f 3 | sed 's/://')
            content=$(echo "$1" | cut -d ':' -f 2-)
            write_file "$file" "$content" ;;
        "delete file "*)
            file=$(echo "$1" | cut -d ' ' -f 3-)
            delete_file "$file" ;;
        "exit") speak "Goodbye!" && exit ;;
        *) return 1 ;;  # Command not found
    esac
}
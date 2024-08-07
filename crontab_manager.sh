#!/bin/bash
# Script para manejar las cronjobs de la Raspberry PI

show_main_menu() {
    clear
    echo "Crontab Manager"
    echo "===============\n"
    echo "1) What is a cronjob?"
    echo "2) List current cronjobs"
    echo "3) Add a new cronjob"
    echo "4) Edit an existing cronjob"
    echo "5) Delete a cronjob"
    echo "6) Enable/Disable cronjob"
    echo "7) Validate and test cronjobs"
    echo "8) Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) explain_cronjob ;;
        2) list_cronjobs ;;
        3) add_cronjob ;;
        4) edit_cronjob ;;
        5) delete_cronjob ;;
        6) toggle_cronjob ;;
        7) validate_cronjobs ;;
        8) exit 0 ;;
        *) echo "Invalid option"; show_main_menu ;;
    esac
}

explain_cronjob() {
    echo -e "\nA cron job is a scheduled task that runs automatically at specified intervals."
    echo "It is commonly used for repetitive tasks such as backups, system maintenance, and monitoring."
    echo -e "\nTo create a cronjob, use the following format:\n"
    echo "  * * * * * /path/to/script.sh"
    echo -e "\nWhere the fields represent:\n"
    echo "  - Minute (0 - 59)"
    echo "  - Hour (0 - 23)"
    echo "  - Day of the month (1 - 31)"
    echo "  - Month (1 - 12)"
    echo "  - Day of the week (0 - 7) (Sunday can be 0 or 7)"
    echo -e "\nExample: To run a script daily at 2:00 AM, use:\n"
    echo "  0 2 * * * /path/to/script.sh\n"
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

list_cronjobs() {
    echo -e "\nCurrent cronjobs:"
    crontab -l || echo "No cron jobs found."
    echo
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

add_cronjob() {
    read -p "Enter the new cron job (e.g., * * * * * /path/to/script.sh): " new_job
    if [ -n "$new_job" ]; then
        (crontab -l; echo "$new_job") | crontab -
        echo "Cronjob added successfully!"
    else
        echo "No cronjob entered!"
    fi
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

edit_cronjob() {
    crontab -l > edit_cronjobs.txt
    nano edit_cronjobs.txt
    crontab edit_cronjobs.txt
    echo "Cronjob updated successfully!"
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

delete_cronjob() {
    crontab -l > delete_cronjobs.txt
    cat -n delete_cronjobs.txt
    read -p "Enter the line number to delete: " line_num
    if [ -n "$line_num" ]; then
        sed -i "${line_num}d" delete_cronjobs.txt
        crontab delete_cronjobs.txt
        echo "Cronjob deleted successfully!"
    else
        echo "Invalid line number!"
    fi
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

toggle_cronjob() {
    crontab -l > toggle_cronjobs.txt
    cat -n toggle_cronjobs.txt
    read -p "Enter the line number to toggle: " line_num
    if [ -n "$line_num" ]; then
        sed -i "${line_num}s/^#//;t;s/^/#/" toggle_cronjobs.txt
        crontab toggle_cronjobs.txt
        echo "Cronjob toggled successfully!"
    else
        echo "Invalid line number!"
    fi
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

validate_cronjobs() {
    echo -e "\nCurrent cronjobs:"
    crontab -l || echo "No cron jobs found."
    echo "You can manually test your cron jobs by running them directly in the terminal."
    read -p "Press Enter to return to the main menu"
    show_main_menu
}

show_main_menu

#!/bin/bash

# Display a menu for the user to choose an operation
function display_menu() {
    echo "-------------------------------"
    echo "User Management and Backup Script"
    echo "1. Create User"
    echo "2. Modify User"
    echo "3. Delete User"
    echo "4. List Users"
    echo "5. Create Backup"
    echo "6. Clean Old Backups"
    echo "0. Exit"
    echo "-------------------------------"
    echo -n "Enter your choice: "
}

# Create a new user
function create_user() {
    read -p "Enter the username to create: " username
    sudo useradd $username
    sudo passwd $username
    echo "User $username created successfully."
}

# Modify an existing user
function modify_user() {
    read -p "Enter the username to modify: " username
    echo "Select an option to modify:"
    echo "1. Change password"
    echo "2. Add user to group"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1)
            sudo passwd $username
            ;;
        2)
            read -p "Enter group name: " groupname
            sudo usermod -a -G $groupname $username
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}

# Delete a user
function delete_user() {
    read -p "Enter the username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted successfully."
}

# List all users
function list_users() {
    echo "List of users:"
    cut -d: -f1 /etc/passwd
}

# Create a backup
function create_backup() {
    read -p "Enter the directory to backup: " dir
    if [ -d "$dir" ]; then
        timestamp=$(date +%F_%T)
        backup_name="backup_$timestamp.tar.gz"
        tar -czvf /backup/location/$backup_name $dir
        echo "Backup created at /backup/location/$backup_name"
    else
        echo "Directory does not exist."
    fi
}

# Clean old backups
function clean_old_backups() {
    find /backup/location -type f -name "*.tar.gz" -mtime +30 -exec rm {} \;
    echo "Old backups older than 30 days have been deleted."
}

# Main script loop
while true; do
    display_menu
    read choice
    case $choice in
        1) create_user ;;
        2) modify_user ;;
        3) delete_user ;;
        4) list_users ;;
        5) create_backup ;;
        6) clean_old_backups ;;
        0) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done


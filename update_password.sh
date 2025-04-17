#!/bin/bash

clear

USER_CREDENTIALS_FILE="credentials.txt"

echo "Update Password"
read -p "Enter your username: " username
read -sp "Enter your current password: " current_password
echo ""

# Check if credentials file exists
if [[ ! -f "$USER_CREDENTIALS_FILE" ]]; then
    echo "Credentials file not found!"
    exit 1
fi

# Authenticate user
if grep -q "^$username:$current_password$" "$USER_CREDENTIALS_FILE"; then
    read -sp "Enter your new password: " new_password
    echo ""
    read -sp "Confirm new password: " confirm_password
    echo ""

    if [[ "$new_password" != "$confirm_password" ]]; then
        echo "Passwords do not match. Try again."
        exit 1
    fi

    escaped_username=$(printf '%s\n' "$username" | sed 's/[][\/.^$*]/\\&/g')
 
    sed -i "s/^$escaped_username:$current_password\$/$escaped_username:$new_password/" "$USER_CREDENTIALS_FILE"
    echo "Password updated successfully!"
else
    echo "Incorrect username or password."
    exit 1
fi


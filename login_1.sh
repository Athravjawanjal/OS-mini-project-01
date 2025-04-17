#!/bin/bash

clear

DATA_FILE="user_data.txt"

USER_CREDENTIALS_FILE="credentials.txt"

echo "Login"
read -p "Enter username: " input_user
read -sp "Enter password: " input_pass
echo ""


if grep -q "^$input_user:$input_pass$" "$USER_CREDENTIALS_FILE"; then
    echo "Login successful!"

    echo "User: $input_user" >> "$DATA_FILE"
else
    echo "Login failed. Incorrect username or password."
fi



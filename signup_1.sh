#!/bin/bash

clear

DATA_FILE="user_data.txt"

USER_CREDENTIALS_FILE="credentials.txt"

echo "Sign Up"
read -p "Enter a new username: " new_username
read -sp "Enter a new password: " new_password
echo ""  

if grep -q "$new_username" "$USER_CREDENTIALS_FILE"; then
   echo "Username already exists. Please try a different one."
else
  echo "$new_username:$new_password" >> "$USER_CREDENTIALS_FILE"
  echo "Sign-up successful! You can now log in."
fi


#!/bin/bash

while true; do
clear
echo "========= SYSTEM MAINTENANCE SUITE ========="
echo "1. Run System Backup"
echo "2. Update & Clean System"
echo "3. Monitor Logs for Errors"
echo "4. Exit"
echo "============================================"
read -p "Enter your choice: " choice

case $choice in
    1) bash backup.sh ;;
    2) bash update_cleanup.sh ;;
    3) bash monitor_logs.sh ;;
    4) echo "Goodbye!"; exit 0 ;;
    *) echo "Invalid Option! Try Again." ;;
esac

echo "Press ENTER to continue..."
read
done


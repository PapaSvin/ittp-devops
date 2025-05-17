#!/bin/bash

EMAIL_TO="stasmarchuk1@gmail.com"
EMAIL_SUBJECT="Disk Space Alert"
EMAIL_BODY="Warning: Free disk space is below 15%."

DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
FREE_SPACE=$((100 - DISK_USAGE))

if [ "$FREE_SPACE" -lt 15 ]; then
    {
        echo "To: $EMAIL_TO"
        echo "From: stanislas.marchuk@yandex.ru"  # Укажите ваш адрес
        echo "Subject: $EMAIL_SUBJECT"
        echo ""
        echo "$EMAIL_BODY"
    } | msmtp $EMAIL_TO
fi
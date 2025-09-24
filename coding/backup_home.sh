#!/bin/bash

USER="alsaoff"
SOURCE_DIR="/home/$USER/"
BACKUP_DIR="/tmp/backup"
LOG_TAG="home-backup"

mkdir -p "$BACKUP_DIR"

logger -t "$LOG_TAG" "Начало резервного копирования домашней директории пользователя $USER"

if rsync -avh --checksum --delete --exclude='.*' --ignore-errors "$SOURCE_DIR" "$BACKUP_DIR" > /dev/null 2>&1; then
    logger -t "$LOG_TAG" "Резервное копирование успешно завершено"
    exit 0
else
    logger -t "$LOG_TAG" "Ошибка при резервном копировании"
    exit 1
fi

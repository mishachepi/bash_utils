#!/bin/bash

# Директория с логами (измените на свою)
LOG_DIR="/var/log/nginx"
BACKUP_DIR="/var/log/nginx/backup"

# Создание папки для бэкапов, если её нет
mkdir -p "$BACKUP_DIR"

# Имя архива с датой
ARCHIVE_NAME="access_logs_$(date +%Y-%m-%d).tar.gz"

# Архивируем все access.log и access.log.1 (если есть)
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$LOG_DIR"/access.log* --remove-files

# Проверка успешности архивации
if [ $? -eq 0 ]; then
    echo "✅ Архив $ARCHIVE_NAME создан в $BACKUP_DIR"
else
    echo "❌ Ошибка при создании архива!"
    exit 1
fi

# Вывести список файлов в архиве (для проверки)
tar -tzf "$BACKUP_DIR/$ARCHIVE_NAME"

# Удаление старых архивов (старше 7 дней)
find "$BACKUP_DIR" -type f -name "access_logs_*.tar.gz" -mtime +7 -exec rm {} \;
echo "🗑️  Старые архивы (старше 7 дней) удалены"

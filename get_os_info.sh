#!/bin/bash

# Проверяем, существует ли файл /etc/os-release
if [ -f /etc/os-release ]; then
  # Читаем файл и извлекаем ключевые параметры
  . /etc/os-release
  echo "Информация об операционной системе:"
  echo "-----------------------------------"
  echo "Название ОС: $NAME"
  echo "Версия ОС: $VERSION"
  echo "ID: $ID"
  echo "ID версии: $VERSION_ID"
  echo "Поддержка (URL): $HOME_URL"
  echo "-----------------------------------"
else
  echo "Ошибка: файл /etc/os-release не найден или доступ к нему ограничен."
fi


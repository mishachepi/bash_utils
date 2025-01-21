#!/bin/bash

# Создаём файл с именем example.txt
file_name="example.txt"

# Записываем текст в файл
echo "Привет, мир! Это простой Bash-скрипт." > $file_name

# Выводим содержимое файла на экран
echo "Содержимое файла $file_name:"
cat $file_name
#!/bin/bash

# Директория с логами
log_directory="/var/log"

# Файл для сохранения отчета
report_file="./error_report.txt"

# Шаблон для поиска ошибок
error_patterns="(error|Error|ERROR|warning|Warning|WARNING)"

# Поиск ошибок в логах и подсчет их количества
grep -E -r "$error_patterns" "$log_directory" | awk -F ':' '{print $5}' | sort | uniq -c | sort -nr > "$report_file"

# Вывод отчета в консоль
echo "Отчет о ошибках в логах:"
#cat "$report_file"

# Подготовка списка наиболее частых ошибок (первые 5)
echo -e "\nНаиболее частые ошибки (первые 5):\n"
head -n 5 "$report_file"

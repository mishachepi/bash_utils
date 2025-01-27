#!/bin/bash

os_version=$(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME=//')
current_date=$(date '+%d.%m.%y')
current_time=$(date '+%H:%M:%S')
uptime_info=$(uptime -p)
system_load=$(uptime | awk -F'[a-z]:' '{ print $2 }')
disk_usage=$(df / | awk '{print $5}' | sed 's/%//' | grep -v Use)
top_processes=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6)
process_count=$(ps -ef | wc -l)
user_count=$(who | wc -l)

echo "Отчет о системе"
echo "Версия операционной системы: $os_version"
echo "Дата: $current_date"
echo "Время: $current_time"
echo "Время работы системы: $uptime_info"
echo "Загруженность системы: $system_load"
echo "Занятое дисковое пространство: $disk_usage'%'"
echo "Топ процессы по использованию памяти:"
echo "$top_processes"
echo "Количество процессов: $process_count"
echo "Количество пользователей: $user_count"

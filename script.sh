#!/bin/bash

INTERVAL=5
DIR=$(dirname "$0")
LOG="$DIR/monitor.log"

touch "$LOG" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "ОШИБКА: Нет прав на запись в файл $LOG" >&2
    exit 1
fi


cleanup() {
    echo
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Мониторинг остановлен пользователем."
    echo "Лог-файл сохранён: $LOG"
    exit 0
}

trap cleanup SIGINT

while true; do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    {
        echo "--- $TIME ---"
        echo
        echo "【1】 Состояние памяти (free -h):"
        free -h
        echo
        echo "【2】 Использование дисков (df -h):"
        df -h
        echo
        echo "【3】 Время работы системы (uptime):"
        uptime
        echo
    } >> "$LOG"
    
    sleep $INTERVAL
done
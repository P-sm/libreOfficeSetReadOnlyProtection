#!/bin/bash

# Проверка наличия аргумента (каталог)
if [[ "$#" -ne 1 ]]; then
    echo "Использование: $0 путь_до_каталога"
    exit 1
fi

DIRECTORY="$1"

find "$DIRECTORY" -type f | while read FILENAME; do
    # Запуск LibreOffice и выполнение макросов/команд
    libreoffice "$FILENAME" &

    # Пауза перед нажатием клавиш
    sleep 3

    # Последовательность команд с задержкой между ними
    xdotool key ctrl+shift+s
    sleep 1
    xdotool key alt+w
    sleep 0.3
    xdotool key Return
    sleep 0.3
    xdotool key Tab
    sleep 0.3
    xdotool key Return
    sleep 0.3
    xdotool key alt+o
    xdotool key space
    xdotool key alt+f
    xdotool key Tab
    xdotool key q
    xdotool key Tab
    xdotool key q
    sleep 1
    xdotool key Return
    sleep 0.3
    xdotool key ctrl+q
done

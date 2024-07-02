#!/bin/bash


if [ "$1" = "--logs" ]; then
    for (( i=1; i<=100; i++ )); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
    echo "Utworzono 100 plików logx.txt"
elif [ "$1" = "--date" ]; then
    echo "Dzisiejsza data: $(date)"
elif [[ "$1" == "--log" && "$2" =~ ^[1-9][0-9]?$|^100$ ]]; then
    num_files="$2"
    for (( i=1; i<=$num_files; i++ )); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
    echo "Utworzono $num_files plików logx.txt"

#!/bin/bash

function display_help {
    echo "Użycie: $0 opcja"
    echo "  --logs         - utworzenie 100 plików logx.txt"
    echo "  --date         - wyświetlenie dzisiejszej daty"
    echo "  --log x        - utworzenie x plików logx.txt (gdzie x = liczba od 1 do 100)"
    echo "  --help         - wyświetlenie pomocy"
}

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
elif [ "$1" = "--help" ]; then
    display_help
else
    echo "Nieznana opcja: $1"
    display_help
    exit 1
fi

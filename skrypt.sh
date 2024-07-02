#!/bin/bash

function display_help {
    echo "Użycie: $0 opcja"
    echo "  --logs, -l     - utworzenie 100 plików logx.txt"
    echo "  --date, -d     - wyświetlenie dzisiejszej daty"
    echo "  --log x         - utworzenie x plików logx.txt (gdzie x = liczba od 1 do 100)"
    echo "  --init         - klonowanie repozytorium do bieżącego katalogu i ustawienie PATH"
    echo "  --help, -h     - wyświetlenie pomocy"
}

if [[ "$1" = "--logs" || "$1" = "-l" ]]; then
    for (( i=1; i<=100; i++ )); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
    echo "Utworzono 100 plików logx.txt"
elif [[ "$1" = "--date" || "$1" = "-d" ]]; then
    echo "Dzisiejsza data: $(date)"
elif [[ "$1" == "--log" || "$1" == "-log" ]]; then
    if [[ "$2" =~ ^[1-9][0-9]?$|^100$ ]]; then
        num_files="$2"
        for (( i=1; i<=$num_files; i++ )); do
            filename="log$i.txt"
            echo "Nazwa pliku: $filename" > "$filename"
            echo "Nazwa skryptu: $0" >> "$filename"
            echo "Data utworzenia: $(date)" >> "$filename"
        done
        echo "Utworzono $num_files plików logx.txt"
    else
        echo "Nieprawidłowa liczba plików. Podaj liczbę od 1 do 100."
        display_help
        exit 1
    fi
elif [[ "$1" = "--init" ]]; then
    git clone https://github.com/artur54168/ZadanieLaboratoria4.git .

    export PATH="$PATH:$(pwd)"

    echo "Zainicjowano repozytorium i ustawiono PATH"
elif [[ "$1" = "--help" || "$1" = "-h" ]]; then
    display_help
else
    echo "Nieznana opcja: $1"
    display_help
    exit 1
fi

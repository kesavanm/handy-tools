#!/bin/bash

function print_colors() {
    echo -e "\n\e[1mColors:\e[0m"
    # print header
    for i in {0..31}; do
        printf "%3d " "$i"
    done
    echo

    for i in {0..31}; do
        printf "++++"
    done
    echo

    # print actual colors
    for code in {0..255}; do
        printf "\e[38;5;%sm%3d\e[0m " "$code" "$code"
        if (( (code + 1) % 32 == 0 )); then
            echo
        fi
    done
}

function print_backgrounds() {
    echo -e "\n\e[1mBackgrounds:\e[0m"
    for code in {0..255}; do
        printf "\e[48;5;%sm%3d\e[0m " "$code" "$code"
        if (( (code + 1) % 32 == 0 )); then
            echo
        fi
    done
}

print_colors
print_backgrounds

# sample usage
echo -e "\n\e[1mSample usage:\e[0m"
echo "( Red:196 TEXT:38 BG:48 ): echo -e \"\e[38;5;196mSample text\e[0m\""

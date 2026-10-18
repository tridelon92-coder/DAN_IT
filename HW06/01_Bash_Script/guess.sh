#!/bin/bash
echo "Welcome to the game Guess a Number"

secret_number=$((RANDOM % 100 + 1))
attempts=0
won=false

while [[ $attempts -lt 5 ]]; do

    if ! read -p "Enter your number: " guess; then
        echo "input closed. Goodbye!"
        exit 0
    fi

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Invalid input!"
        continue
    fi

    if [[ ${#guess} -gt 3 ]]; then
        echo "Number is too long!"
        continue
    fi

    guess=$((10#$guess))

    if [[ $guess -lt 1 || $guess -gt 100 ]]; then
        echo "Number must be between 1 and 100!"
        continue
    fi

    ((attempts++))
    echo "Your guess is: $guess"

    if [[ $guess -eq $secret_number ]]; then
        echo "Congratulations! You guessed the right number"
        won=true
        break
    elif [[ $guess -gt $secret_number ]]; then
        echo "Too high!"
    else
        echo "Too low!"
    fi
done

if [[ $won == "false" ]]; then
    echo "Sorry, you have run out of attempts."
    echo "The correct number was: $secret_number"
fi
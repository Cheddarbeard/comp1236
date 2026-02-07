#!/bin/bash

read -p "Enter the lower limit (a): " a
read -p "Enter the upper limit (b): " b

# Positive Integer Filter
if [[ ! $a =~ ^[0-9]+$ || ! $b =~ ^[0-9]+$ || $a -gt $b ]]; then
    echo "Error: Please enter valid positive integers with a ≤ b."
	echo "Try again, please."
    read -p "Enter the lower limit (a): " a
	read -p "Enter the upper limit (b): " b
fi

echo
echo "Hexagonal numbers in range [$a, $b]:"
echo "-----------------------------------"

oddcount=0 
evencount=0
oddsum=0
evensum=0
found=false

n=1

# Hexagonal Numbers Calculations
while true; do
    hex=$((n * (2 * n - 1)))

    if ((hex > b)); then
        break
    fi

    if ((hex >= a && hex <= b)); then
        found=true
        if ((hex % 2 == 0)); then
            echo "$hex is even"
            ((evencount++))
            ((evensum += hex))
        else
            echo "$hex is odd"
            ((oddcount++))
            ((oddsum += hex))
        fi
    fi

    ((n++))
done

if [ "$found" = false ]; then
    echo "No hexagonal numbers found in range [$a, $b]."
	exit 0
fi

# Results Screen
echo
echo "Results:"
echo "-----------------------------------"
echo "Total odd hexagonal numbers:  $oddcount"
echo "Sum of odd hexagonal numbers: $oddsum"
echo "Total even hexagonal numbers: $evencount".
echo "Sum of even hexagonal numbers: $evensum"

$SHELL
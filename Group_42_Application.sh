#!/bin/bash

#defining functions
function get_integer() {
##########
# Getting an Integer from the User
##########
#
# A function for verifying and returning a positive integer inputted by the user
#
##########
# Coded by Cameron Ross - 2025
##########
  # Loop until we have a valid input
	while true
	do
		read -p "Please Enter a Positive Integer: " user_input
  # Check if input is a valid positive integer:
		if [[ $user_input =~ ^[1-9][0-9]*$ ]]; then
			break
		fi
	done
  # Return value
	echo "$user_input"
}

function hexagonal(){
########## Calculating Hexagonal Numbers
#
# Position in Sequence
# 1 | 2 | 3 | 4 | 5 | 6 | etc
# --------------------------
# 1 | 6 | 15| 28| 45| 91|
# Hexagonal Number
#
# each Hexagonal number follows the formula f(n)=2(2n-1)
#
# Outputs:
# All Hexagonal numbers within a user specified range [a, b]
# Whether each printed number is odd or even
# Total number of odd Hexagonal numbers found
# Total number of even Hexagonal numbers found
# Sum of all odd Hexagonal numbers found
# Sum of all even Hexagonal numbers found
##########
# Coded by Raymond Li - 2025
##########
  clear
  read -p "Enter the lower limit (a): " a
  read -p "Enter the upper limit (b): " b

  # Positive Integer Filter
  while [[ ! $a =~ ^[0-9]+$ || ! $b =~ ^[0-9]+$ || $a -gt $b ]]
  do
    clear
    echo "Error: Please enter valid positive integers with a ≤ b."
    echo "Try again, please."
    read -p "Enter the lower limit (a): " a
    read -p "Enter the upper limit (b): " b
  done

  echo
  echo "Hexagonal numbers in range [$a, $b]:"
  echo "-----------------------------------"

  odd_count=0
  even_count=0
  odd_sum=0
  even_sum=0
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
              ((even_count++))
              ((even_sum += hex))
          else
              echo "$hex is odd"
              ((odd_count++))
              ((odd_sum += hex))
          fi
      fi

      ((n++))
  done

  if [ "$found" = false ]; then
      echo "No hexagonal numbers found in range [$a, $b]."
      echo
  else
     # Results Screen
      echo
      echo "Results:"
      echo "-----------------------------------"
      echo "Total odd hexagonal numbers:  $odd_count"
      echo "Sum of odd hexagonal numbers: $odd_sum"
      echo "Total even hexagonal numbers: $even_count".
      echo "Sum of even hexagonal numbers: $even_sum"
      echo "-----------------------------------"
      #end
  fi

  while true
    do
      read -p "Would you like to return to the (M)ain menu or (E)xit the program: " choice
      case $choice in
        [mM])
          break
          ;;
        [eE])
          exit 0
          ;;
        *)
          clear
          echo Invalid Selection, please try again
      esac
    done
}
### END OF HEXAGONAL FUNCTION

function squares(){
  ##########
  # Calculating Squares in Odd Positions
  ##########
  # Position in Sequence
  # 1 | 2 | 3 | 4 | 5 | 6 | etc
  # --------------------------
  # 1 | 4 | 9 | 16| 25| 36|
  # Square
  #
  # each square number is its position in the sequence times itself.
  #
  # Outputs:
  # A number of Odd Squares in sequence as specified by the user
  # Whether each of the echoed Squares is the factor of an integer specified by the user
  # Numbers that can be written as the sum of two consecutive squares, up to a max value specified by the user
  #
  # From the user we get:
  # initial_position: An initial position in the sequence
  # number_of_squares: A number of Odd Squares to echo
  # number_to_factor: A number to check if our echoed squares are a factor of
  # max_value_for_consecutives: A maximum for finding values the result from summing consecutive squares
  #
  ##########
  # Coded by Cameron Ross - 2025
  ##########

  # initialize variables
  squares_found=0
  consecutive_counter=1
  consecutive_sum=0
  consecutives_found=0
  clear
  # Acquire valid user data
  Echo "What's the initial position in the Sequence of Squares?"
  initial_position=$(get_integer)
  clear
  echo "Initial Position in the Sequence: $initial_position"
  echo "How many odd squares should we calculate?"
  number_of_squares=$(get_integer)
  clear
  echo "Initial position in the sequence: $initial_position"
  echo "How many odd squares to find: $number_of_squares"
  echo "What number should we check if found squares are a factor of?"
  number_to_factor=$(get_integer)
  clear
  echo "Initial position in the sequence: $initial_position"
  echo "How many odd squares to find: $number_of_squares"
  echo "Checking if squares are a factor of: $number_to_factor"
  echo "What is the maximum value we should calculate the sum of consecutive squares to?"
  max_value_for_consecutives=$(get_integer)

  # Sequence of Squares
  clear
  echo -------
  echo - Sequence of Squares
  echo -------
  echo "Displaying $number_of_squares odd squares starting from position $initial_position in the Sequence"
  echo -------
  # make sure first calculated square is odd
  if ((initial_position%2==0)); then
    number_to_square=$((initial_position+1))
  else
    number_to_square=$initial_position
  fi

  #while we need to find more square numbers
  while ((squares_found < number_of_squares))
  do
    current_square=$((number_to_square**2))
    #check if it's a factor
    if ((number_to_factor%current_square==0)); then
      is_it_factor="IS"
    else
      is_it_factor="IS NOT"
    fi
    #display result
    echo "$current_square is number $number_to_square in the sequence of squares"
    echo "$current_square $is_it_factor a factor of $number_to_factor"
    echo -------
    #prepare for next iteration of loop
    ((squares_found++))
    number_to_square=$((number_to_square+2)) # +2 to ensure we only work with odd squares
  done

  # Sum of consecutive squares
  # while we're below the max value
  echo
  echo -------
  echo - Sum of consecutive Squares
  echo -------
  while true
  do
    consecutive_sum=$((consecutive_counter**2+(consecutive_counter+1)**2))
    # ensure we haven't surpassed the max value
    if ((consecutive_sum<=max_value_for_consecutives)); then
      echo "$consecutive_sum is the sum of consecutive squares"
      ((consecutives_found++))
    else
      break
    fi
    ((consecutive_counter++))
  done
  # final results
  echo "There are $consecutives_found consecutive sums of squares less than or equal to $max_value_for_consecutives"
  echo --------
  echo
  # determine next step
  while true
  do
    read -p "Would you like to return to the (M)ain menu or (E)xit the program: " choice
    case $choice in
      [mM])
        break
        ;;
      [eE])
        exit 0
        ;;
      *)
        clear
        echo Invalid Selection, please try again
    esac
  done
}
### END OF SQUARES FUNCTION

function quadratic() {
########## Calculating a Quadratic Sequence
#
# Calculating numbers of the form an^2+bn+c within a range of n
#
# Outputs:
# All of the sequence numbers within a user specified range [n1, n2]
# Whether calculated result is a prime
# The sum of all numbers in range
# The product of the first and last number in range
# Whether the calculated product is a multiple of user specified number
########
# Coded by Matthew Taylor - 2025
########
  clear
  primeCount=0
  sum=0
  # Take user inputs
  read -p "Enter a (non-negative integer): " a
  read -p "Enter b (non-negative integer): " b
  read -p "Enter c (non-negative integer): " c

  read -p "Enter n1 (Start of range): " n1
  read -p "Enter n2 (End of range): " n2
  echo
  echo "Terms"

  # Loop to find each term within the given range
  for ((n=n1;n<=n2;n++));
  do
    term=$((a*n*n+b*n+c))
    echo "$term"

    # Checks if the number is prime
    isPrime=1

    for ((i=2; i<term; i++));
    do
      if((term%i==0));
      then
        isPrime=0
        break
      fi
    done


    if ((isPrime==1));
    then
      echo "Prime"
      primeCount=$((primeCount+1))
    else
      echo "Not Prime"
    fi

    # Save the result of the first loop
    if((n==n1));
      then
      firstTerm=$term
    fi
    # Save the result of the last loop
    if((n==n2));
      then
      lastTerm=$term
    fi
    # Sum the result of each loop
    sum=$((sum+term))
  done

  # Calculates the product of the first and last term
  product=$((firstTerm*lastTerm))

  echo "Amount of prime numbers: ""$primeCount"
  echo "Sum of terms: ""$sum"
  echo "Product of first and last terms: ""$product"
  echo
  read -p "Enter a number: " x
  echo
  # Checks if the product of p1 and p2 is a multiple of x inputted from user
  if((product%x==0))
    then
    echo "$product"" is a multiple of ""$x"
  else
    echo "$product"" is not a multiple of ""$x"
  fi
  echo
  while true
    do
      read -p "Would you like to return to the (M)ain menu or (E)xit the program: " choice
      case $choice in
        [mM])
          break
          ;;
        [eE])
          exit 0
          ;;
        *)
          clear
          echo Invalid Selection, please try again
      esac
    done
  }
### END OF QUADRATICS FUNCTION

# on opening the program
# initialize variables
valid_entry=1
attempts=3
clear
echo "|------------------------------------|"
echo "|                                    |"
echo "|        Group Assignment            |"
echo "|                                    |"
echo "|------------------------------------|"
echo
echo "Welcome to our project"
#ask for, and check password
while true; do
  read -p "Please enter the password: " passw
   ((attempts--))
  #break out of loop when password is correct
  if [ "$passw" = "w22" ]; then
    break
  #warn on last attempt
  elif ((attempts==1)); then
    echo "WARNING: This is your last attempt"
  #quit when out of attempts
  elif ((attempts==0)); then
    exit
  fi
  echo "Incorrect, please try again"
done

while true
do
  # display the main menu selections
  clear
  echo "|------------------------------------|"
  echo "|                                    |"
  echo "|        Group Assignment            |"
  echo "|                                    |"
  echo "|------------------------------------|"
  echo
  echo "Welcome to our project"
  echo "Wound you like to calculate some numbers?"
  echo
  echo " |---------==Main Menu==-------------|"
  echo " | Calculate (H)exagonal Numbers   |"
  echo " | Calculate (S)quare Numbers      |"
  echo " | Calculate (Q)uadratic Numbers   |"
  echo " |-----------------------------------|"
  echo
  # warn user if their last entry was invalid
  if ((valid_entry==0)); then
    echo "**Invalid entry, please try again**"
  fi
  # get choice from user
  read -p "Please type your option (H/S/Q): " menu_option
  case $menu_option in
    [hH])
      valid_entry=1
      hexagonal
      ;;
    [sS])
      valid_entry=1
      squares
      ;;
    [qQ])
      valid_entry=1
      quadratic
      ;;
    *)
      valid_entry=0
      ;;
  esac
done

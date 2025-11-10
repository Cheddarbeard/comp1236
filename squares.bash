########## Calculating Squares in Odd Positions
#
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
# Whether each of the echoed Squares is the factor of an interger specified by the user
# Numbers that can be written as the sum of two consectutive squares, up to a max value specified by the user
#
# From the user we get:
# initial_position: An initial position in the sequence
# number_of_squares: A number of Odd Squares to echo
# number_to_factor: A number to check if our echoed squares are a factor of
# max_value_for_consecutives: A maximum for finding values the result from summing consectutive squares
#
##########

# initialize variables
initial_position=null
number_of_squares=null
number_to_factor=null
max_value_for_consecutives=null
squares_found=0
consectutive_one=1
consectutive_two=2
consectutive_sum=0
consectutives_found=0

# Acquire valid user data

#while ! [ "$initial_position" -eq "$initial_position" ]
#do
	clear
#	if ! [ "$initial_position" -eq "$initial_position" ]; then
#		echo Please enter a positive interger
#	fi
	read -p "Please enter an interger for the initial position in the Sequence of Squares: " initial_position
#done
#while number_of_squares is not an interger
	clear
	echo Initial Position in the Sequence: $initial_position
	read -p "Please enter an interger for how many odd squares should we find: " number_of_squares
#done
#while number_to_factor is not an interger
	clear
	echo Initial position in the sequence: $initial_position
	echo How many odd sqaures to find: $number_of_squares
	read -p "Please enter an interger to check if found sqares are a factor: " number_to_factor
#done
#while max_value_for_consecutives is not an interger
	clear
	echo Initial position in the sequence: $initial_position
	echo How many odd sqaures to find: $number_of_squares
	echo Checking if squares are a factor of: $number_to_factor
	read -p "Please enter maximum value for finding the sum of consectutive squares: " max_value_for_consecutives
#done

# Sequence of Squares
# make sure first calculated square is odd
if ((initial_position%2==0)); then
	let number_to_square=initial_position+1
else
	let number_to_square=initial_position
fi

#while we need to find more square numbers
clear
echo
echo "------- Sequence of Squares"
while ((squares_found < number_of_squares))
do
	let current_square=number_to_square*number_to_square
#check if it's a factor
	if ((number_to_factor%current_square==0)); then
		is_it_factor="IS"
	else
		is_it_factor="IS NOT"
	fi
#display results
	echo $current_square is number $number_to_square in the sequence of squares
	echo $current_square $is_it_factor a factor of $number_to_factor
	echo ------
#prepare for next iteration of loop
	let squares_found+=1
	let number_to_square+=2
done

# Sum of consectutive squares
# while we're below the max value
echo 
echo "------- Sum of Consectutive Squares"
echo 
while ((consectutive_sum < max_value_for_consecutives))
do
	let consectutive_sum=consectutive_one*consectutive_one+consectutive_two*consectutive_two
# ensure we haven't surpased the max value
    if ((consectutive_sum<=max_value_for_consecutives)); then
		echo $consectutive_sum is the sum of two consectutive squares
		let consectutives_found+=1
	fi
	let consectutive_one+=1
	let consectutive_two+=1
done
# final results

echo We found $consectutives_found consectutive sums of squares up to $max_value_for_consecutives

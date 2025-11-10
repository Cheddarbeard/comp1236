########## Calculating Hexagonal Numbers
#
# Position in Sequence
# 1 | 2 | 3 | 4 | 5 | 6 | etc
# --------------------------
# 1 | 6 | 15| 28| 45| 91|
# Hexagonal Number
#
# each Hexagonal number follows the formula f(n)=n*(4n-2)/2
#
# Outputs:
# All Hexagonal numbers within a user specified range [a, b]
# Whether each printed number is odd or even
# Total number of odd Hexagonal numbers found
# Total number of even Hexagonal numbers found
# Sum of all odd Hexagonal numbers found
# Sum of all even Hexagonal numbers found
#
# Inputs:
# begin_range: Beginning of range for found Hexagonal Numbers
# end_range: End of range for found Hexagonal Numbers
##########

# initialize variables
begin_range = null
end_range = null
sum_of_odd=0
sum_of_even=0
total_odd=0
total_even=0
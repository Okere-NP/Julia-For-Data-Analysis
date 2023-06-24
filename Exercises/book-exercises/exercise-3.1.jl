#=
    1. Create an x variable that is a range of values from 1 to 10^6.
    2. Now, using the collect function, create a y vector holding the same values as the x range.
    3. Using the @btime macro, check the time of sorting x and y by using the sort function.
    4. Finally, using the @edit macro, check the implementation of the sort function that would be invoked
    when you sort the x range.
=#

# Importing the BenchmarkTools package to implement the @btime macro
using BenchmarkTools

# Initiate variable x and y
x = 1:10^6;
y = collect(x);

# implementing the @btime macro
@btime sort(x);
@btime sort(y);

# implementing the @edit macro
@edit sort(x) # making use of sort(r::AbstractUnitRange)
@edit sort(y) # making use of sort(v::AbstractVector)
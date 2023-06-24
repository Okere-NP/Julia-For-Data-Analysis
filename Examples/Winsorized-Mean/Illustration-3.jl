#= IMPROVED IMPLEMENTATION OF WINSORIZED MEAN =#

#= 1. Create a function named winsorized_mean with argument x and k.
   Vector x holds the data for which we want to compute the mean,
   and integer k indicates the number of smallest and largest values to replace.
=#
function winsorized_mean(x::AbstractVector, k::Integer)
    # Error Handling
    k >= 0 || throw(ArgumentError("k must be non-negative."))
    length(x) > 2 * k || throw(ArgumentError("k is too large."))

    #=   2. Sort the vector x and store the result in a variable y.
         This way, k smallest values are at the beginning of the vector y, and k largest are at its end.
    =#
    y = sort!(collect(x))

    #=   3. Replace k smallest values by the (k + 1)st smallest value in vector y by using a loop.
         Similarly, replace k largest values by the (k + 1)st largest value.
    =#
    for i in 1:k
        y[i] = y[k + 1]
        y[end - i + 1] = y[end - k]
    end

    #=   4. Calculate the mean of vector y by first summing its elements 
         and then dividing the result by the length of vector y.
         The obtained result is the k-times winsorized mean of the original vector x.
    =#
    mean_y = sum(y) / length(y)
    return mean_y
end

# Code Execution Unit
arr = [8, 3, 1, 5, 7];
winsorized_mean(arr, 1)

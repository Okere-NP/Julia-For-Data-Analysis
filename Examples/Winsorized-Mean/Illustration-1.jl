#= CALCULATING THE WINSORIZED MEAN USING JULIA REPL =#

#=  1. Initialize the input data.
    Vector x holds the data for which we want to compute
    the mean, and integer k indicates the number of smallest and largest values to replace.
=#
x = [8, 3, 1, 5, 7];
k = 1;
    
#=  2. Sort the vector x and store the result in a variable y.
    This way, k smallest values are at the beginning of the vector y, and k largest are at its end.
=#
y = sort(x);

#=  3. Replace k smallest values by the (k + 1)st smallest value in vector y by using a loop.
    Similarly, replace k largest values by the (k + 1)st largest value. 
=#
for i in 1:k
    y[i] = y[k + 1]
    y[end - i + 1] = y[end - k]
end

#=
    4. Calculate the mean of vector y by first summing its elements 
    and then dividing the result by the length of vector y.
    The obtained result is the k-times winsorized mean of the original vector x.
=#
s = 0;
for v in y
    global s += v
end


# Code Execution Unit
y
s
mean_y = s / length(y)
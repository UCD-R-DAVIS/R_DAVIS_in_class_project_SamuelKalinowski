set.seed(15) #used to create random numbers that can be reproduced. Helps everyone everyone start in same set of space
runif #generates random numbers from a uniform distribution
replace #fed in vector with index values and replaced these values with NA

#! is not the function or value after
hw2[complete.cases(hw2)] #looking for missing data in the data frame. Will take data with complete observations. Use carefully


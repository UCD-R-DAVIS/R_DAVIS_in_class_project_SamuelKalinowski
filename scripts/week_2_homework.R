### Setup ----
set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2


### Problem 1 ----
prob1 <- hw2[!is.na(hw2)] #removing the NAs I think

prob1 <- prob1[prob1 >= 14 & prob1 <= 38] #selecting numbers between and including 14 & 38

### Multiply by 3 ----
times3 <- prob1 * 3 #multiplied each number in the prob1 vector by 3

### Add 10 ----
plus10 <- times3 + 10 #added 10 to the vector 

### Selecting every other number ----
final <- plus10[c(TRUE, FALSE)] #I believe this should have selected every other number in the vector so that I ended up with 12 values which I can see in the environment for final

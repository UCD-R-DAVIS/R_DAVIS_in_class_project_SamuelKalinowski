###Vector Math ----
> x <- 1:10
> x
[1]  1  2  3  4  5  6  7  8  9 10
> x + 3
[1]  4  5  6  7  8  9 10 11 12 13
> x * 10
[1]  10  20  30  40  50  60  70  80  90 100
> x + c(3)
[1]  4  5  6  7  8  9 10 11 12 13
> y <- 100:109
> y <- 100:109
> y
[1] 100 101 102 103 104 105 106 107 108 109
> x + y
[1] 101 103 105 107 109 111 113 115 117 119
> cbind(x,y, x+y)
x   y    
[1,]  1 100 101
[2,]  2 101 103
[3,]  3 102 105
[4,]  4 103 107
[5,]  5 104 109
[6,]  6 105 111
[7,]  7 106 113
[8,]  8 107 115
[9,]  9 108 117
[10,] 10 109 119
> z <- 1:2
> z
[1] 1 2
> x + z
[1]  2  4  4  6  6  8  8 10 10 12
> cbind (x, z, x+z)
x z   
[1,]  1 1  2
[2,]  2 2  4
[3,]  3 1  4
[4,]  4 2  6
[5,]  5 1  6
[6,]  6 2  8
[7,]  7 1  8
[8,]  8 2 10
[9,]  9 1 10
[10,] 10 2 12
> 
  > z <- 1:3
> z
[1] 1 2 3
> cbin(x,z, x+z)
Error in cbin(x, z, x + z) : could not find function "cbin"
> cbind(x,z, x+z)
x z   
[1,]  1 1  2
[2,]  2 2  4
[3,]  3 3  6
[4,]  4 1  5
[5,]  5 2  7
[6,]  6 3  9
[7,]  7 1  8
[8,]  8 2 10
[9,]  9 3 12
[10,] 10 1 11
Warning messages:
  1: In x + z :
  longer object length is not a multiple of shorter object length
2: In cbind(x, z, x + z) :
  number of rows of result is not a multiple of vector length (arg 2)
> a <- x+z
Warning message:
  In x + z : longer object length is not a multiple of shorter object length
> 
  > x[c(TRUE, FALSE)]
[1] 1 3 5 7 9
> x[c(TRUE, FALSE, FALSE)]
[1]  1  4  7 10
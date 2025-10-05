# Matrix Addition & Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Addition
A_plus_B <- A + B
A_plus_B

# Subtraction
A_minus_B <- A - B
A_minus_B

# Create a Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
D

# Construct a Custom 5 × 5 Matrix

M <- diag(3, 5, 5)          
M[1, 2:5] <- 1              
M[2:5, 1] <- 2    
M

Output 
[Workspace loaded from ~/.RData]

> A <- matrix(c(2, 0, 1, 3), ncol = 2)
> B <- matrix(c(5, 2, 4, -1), ncol = 2)
> A_plus_B <- A + B
> A_plus_B
     [,1] [,2]
[1,]    7    5
[2,]    2    2
> A_minus_B <- A - B
> A_minus_B
     [,1] [,2]
[1,]   -3   -3
[2,]   -2    4
> D <- diag(c(4, 1, 2, 3))
> D
     [,1] [,2] [,3] [,4]
[1,]    4    0    0    0
[2,]    0    1    0    0
[3,]    0    0    2    0
[4,]    0    0    0    3
> M <- diag(3, 5, 5)          
> M[1, 2:5] <- 1              
> M[2:5, 1] <- 2    
> M
     [,1] [,2] [,3] [,4] [,5]
[1,]    3    1    1    1    1
[2,]    2    3    0    0    0
[3,]    2    0    3    0    0
[4,]    2    0    0    3    0
[5,]    2    0    0    0    3
> 

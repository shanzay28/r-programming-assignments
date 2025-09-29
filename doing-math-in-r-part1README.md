# Create the matrices
A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

#Inspect dimensions
dim(A)  
dim(B)

#Compute inverse and determinant

invA <- tryCatch(solve(A), error = function(e) e)
detA <- tryCatch(det(A),   error = function(e) e)


invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)

invA; detA; invB; detB

> A <- matrix(1:100,  nrow = 10)
> B <- matrix(1:1000, nrow = 10)
> dim(A)  
[1] 10 10
> dim(B)
[1]  10 100
> invA <- tryCatch(solve(A), error = function(e) e)
> detA <- tryCatch(det(A),   error = function(e) e)
> invB <- tryCatch(solve(B), error = function(e) e)
> detB <- tryCatch(det(B),   error = function(e) e)
> invA; detA; invB; detB
<simpleError in solve.default(A): Lapack routine dgesv: system is exactly singular: U[6,6] = 0>
[1] 0
<simpleError in solve.default(B): 'a' (10 x 100) must be square>
<simpleError in determinant.matrix(x, logarithm = TRUE, ...): 'x' must be a square matrix>

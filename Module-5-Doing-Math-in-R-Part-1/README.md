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

OUTPUT

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


-----------------------------------------

Why solve(A) and det(A) work 
A is a square matrix (10×10), hence det(A) is defined and equals 0, which means that A is unique (not invertible). det(A) = 0, solve(A) properly gives a solitary system error (there is no inverse).

Why operations on B fail (non‑square matrix).
B is not a square (10×100). Inverse and determinants are only defined for square matrices, therefore both calls are wrong by definition.
A determinant close to 0 means (almost) singularity and computations that aren't stable.
It's better to use solution(A, b) (or qr.solve/SVD) to solve systems than to make an explicit inverse; it's more reliable and quicker.






[1] 0
<simpleError in solve.default(B): 'a' (10 x 100) must be square>
<simpleError in determinant.matrix(x, logarithm = TRUE, ...): 'x' must be a square matrix>

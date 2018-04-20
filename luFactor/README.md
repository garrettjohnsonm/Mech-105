## LU Factorization Function

luFactor is a function that has one input, A: a given square matrix, and 3
outputs L, U, and P (all the same size matrix as A.)

## Outputs:

L is a lower triangle matrix with 1 across the diagonal and the factors of gauss elimination
used to obtain matrix U below to diagonal. 

U is an upper triangle matrix obtained by using gauss elimination method on the matrix A.  

P is the identity matrix rearranged whenever any row is pivoted.  

luFactor's inputs and outputs should satisfy the equation: [P][A]=[L][U]

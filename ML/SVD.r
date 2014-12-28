# the complexity of PCA for  n data points, each represented with p features comes from
# covariance matrix computation: O(p2n) and eigen-value decomposition ]: O(p3) => O(p2n+p3).
# O(min(p^3,n^3));  SVD: O(4m2n + 8mn2 + 9n3)
# computing the SVD of a mxn matrix immediately yields its PCA
# the complexity of SVD for m∗n matrix is (m*n^2 + n^3)
## 1st step: O(mn2) floating-point operations for reducing the matrix to a bidiagonal one
## 2nd step: SVD itself costs O(n) flops

# simple implementation of randomized SVD in R

ransvd = function(A, k=10, p=5) {
  n = nrow(A)
  y = A %*% matrix(rnorm(n * (k+p)), nrow=n)
  q = qr.Q(qr(y))
  b = t(q) %*% A
  svd = svd(b)
  list(u=q %*% svd$u, d=svd$d, v=svd$v)
}

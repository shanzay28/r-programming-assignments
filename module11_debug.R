tukey.outlier <- function(v) {
  q <- quantile(v, c(0.25, 0.75), na.rm = TRUE, names = FALSE)
  iqr <- q[2] - q[1]
  (v < q[1] - 1.5 * iqr) | (v > q[2] + 1.5 * iqr)
}


corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_tukey(test_mat)

# 3 
tukey.outlier <- function(v) {
  q <- quantile(v, c(0.25, 0.75), na.rm = TRUE, names = FALSE)
  iqr <- q[2] - q[1]
  (v < q[1] - 1.5 * iqr) | (v > q[2] + 1.5 * iqr)
}


corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

res <- corrected_tukey(test_mat)
res                
length(res)         
typeof(res)         





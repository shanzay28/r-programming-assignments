assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Broken version (will cause an error)
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}
myMean(assignment2)

myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}
result <- myMean(assignment2)
print(result)  # Expected output: 19.25

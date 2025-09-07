# Assignment 2 – Evaluating `myMean` Function  

I used R to test a custom function that was meant to determine a vector's mean for this assignment. The steps I took, the mistake I ran into, the cause, and how I fixed the function are all detailed here.  
---
I tried the provided `myMean` method with a vector I named `assignment2`. The error notice:  
Error in sum(assignment) : object 'assignment' not found
This occurred because `assignment2` was the name of the function parameter, but `assignment` and `someData`, which were never specified, were used inappropriately within the function.  
I changed the code to use `assignment2` as the parameter consistently in order to address the issue. The updated version runs correctly and yields the vector's accurate mean of **19.25**.  

### R Code  
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
# Provided code
myMean <- function(assignment2) {
  return(sum(assignment) / length(someData))
}
myMean(assignment2)

# Correct code 
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}
result <- myMean(assignment2)
print(result)
[1] 19.25

### Blog Post  

https://r-rstudio-installation.blogspot.com/2025/09/assignment.html






















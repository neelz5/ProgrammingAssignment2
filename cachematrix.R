## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Function to create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  # Initialize a variable to store the cached inverse
  inverse <- NULL
  
  # Function to set the matrix
  set <- function(matrix) {
    x <<- matrix  # Use <<- to assign to the parent environment
    inverse <<- NULL  # Reset the cached inverse when the matrix changes
  }
  
  # Function to get the matrix
  get <- function() {
    x  # Return the matrix
  }
  
  # Function to set the inverse and return it
  setInverse <- function(inverseMatrix) {
    inverse <<- inverseMatrix  # Cache the inverse
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    inverse  # Return the cached inverse
  }
  
  # Return a list of functions
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


 

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  # Get the cached inverse
  inverse <- x$getInverse()
  
  # If the cached inverse is not NULL, return it
  if (!is.null(inverse)) {
    message("Getting cached inverse")
    return(inverse)
  }
  
  # If the cached inverse is NULL, compute the inverse
  matrix <- x$get()
  inverse <- solve(matrix, ...)
  
  # Cache the computed inverse
  x$setInverse(inverse)
  
  # Return the computed inverse
  inverse
}




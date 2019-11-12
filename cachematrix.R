## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    #function setting matrix
    x <<- y
    m <<- NULL
  }
  get <- function() {
    #function getting matrix
    x
  }
  set_invmatrix <- function(matrix) {
    #function setting inverse of matrix
    m <<- matrix
  }
  get_invmatrix <- function() {
    #function getting inverse of matrix
    m
  }
  list(set = set, get = get,
       set_invmatrix = set_invmatrix,
       get_invmatrix = get_invmatrix)
}

## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  # getting inverse matrix from cached
  m <- x$get_invmatrix()
  
  #returning the inverse if found in cache
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  #getting the matrix
  data <- x$get()
  #if (det(data) != 0) {
  
  #solving the inverse
  m <- solve(data) %*% data
  #setting the inverse matrix into cache
  x$set_invmatrix(m)
  m
  #} else message("")
  ## Return a matrix that is the inverse of 'x'
}
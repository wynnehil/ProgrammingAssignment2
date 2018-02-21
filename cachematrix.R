#Caching the Inverse of a Matrix
#Your assignment is to write a pair of functions that cache the inverse of a matrix.

#Write the following functions:

#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) { #set the value of the vector
    x <<- y
    m <<- NULL 
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse #set the inverse
  getinverse <- function() m #get the value of the inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

#The following function returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data woooo hooooo")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

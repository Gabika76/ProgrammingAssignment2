## Store a given matrix and calculate and store its inverse for further
## usage

## creates an object and the list of functions to get/set the matrix 
## and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  #store the functions
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Return a matrix that is the inverse of 'x' 

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  #returns the inverse matrix if cached yet ...
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #... otherwise it is calculated and stored 
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

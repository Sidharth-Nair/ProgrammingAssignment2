## Put comments here that give an overall description of what your
## functions do

## The function 'makeCacheMatrix' will create a matrix object that can cahce its inverse

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y){
    x <<- y
    j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get,setInverse = setInverse, getInverse = getInverse)
}


## The function 'cacheColve' will inverse the matrix returned by the above fucntion, 'makeCacheMatrix'

cacheSolve <- function(x, ...) {
  j <- x$getInverse()
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}

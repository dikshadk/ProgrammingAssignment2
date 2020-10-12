## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}

#Lets assume that the matrix given is always invertible
#The makeCacheMatrix is a function that creates a special matrix that can cache its inverse easily
makeCacheMatrix <- function(x = matrix()) {
  d <- NULL
  set <- function(y){
    x <<- y
    d <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) d <<- inverse
  getInverse <- function() d 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse
}
#In order to to compute the inverse of the special matrix returned by makeCacheMatrix above. 
#If the inverse has been already computed, and the matrix hasn’t changed, 
#cacheSolve should retrieve the inverse from the cache
#We make use of the solve function in R to calculate the inverse of a square matrix


cacheSolve<-function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
  cacheSolve <- function(x, ...){
    d <- x$getInverse()
    if(!is.null(d)) {
      message("getting cached data")
      return(d)
    }
    mat <- x$get()
    d <- solve(mat, ...)
    x$setInverse(d)
    d
  }
  

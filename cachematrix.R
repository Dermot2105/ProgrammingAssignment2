<<<<<<< HEAD
##  Programming Assignment 2

##  The aim of this program is to create a list of functions which will 
##  be passsed to another function which will then use them to calculate
##  the inverse of a matrix.  
##  It also creates some variabel that can be used by the other function.
##  If the inverse has been calculated before then the previous result will
##  be returned without recalculaion thus speeding up the processing time.

makeMatrix <- function(x = matrix()) {  ## the function takes a matrix 
                                        ## which is to be inverted.
                                        ## I assume it is invertible.
  
  m <- NULL                             ## m will be a variable that is
                                        ## set initially to NULL to ensure
                                        ## that it exists and that it 
                                        ## cancels any previous value of m
  
  set <- function(y) {                  ## set is a function that passes a 
                                        ## a value to a second variable and
                                        ## resets m to NULL.  This is not
                                        ## in cacheinverse but can be used
                                        ## by a user manually when 
                                        ## changing the matrix.
    x <<- y
    m <<- NULL
    
  }
  
  get <- function() x                   ##  get() is a function that returns
                                        ##  whatever is passed to it.
  
  setinverse <- function(solve) m <<- solve  ## setinverse is a function 
                                             ## that passed the inverse to
                                             ## m so that it can be cached
  
  getinverse <- function() m                 ## getinverse returns any 
                                             ## pre-exisitng m
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)             ## this returns the functions
                                            ## as a list.
}
  


# This function is passed the results of makeMatrix() (a list of functions) 
## and also a matrix cached in x.

cacheinverse <- function(x, ...) {
  
  m <- x$getinverse()               ## getinverse() is a function that 
                                    ## returns m which will be NULL if no 
                                    ## previous calculation on the same 
                                    ## matrix. Otherwise will set m to the 
                                    ## existing result.
  
  if(!is.null(m)) {                 ## This returns any preexisitng result
                                    ## and then stops.
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()                   ## WHen there is no pre-exisitng result
                                    ## this takes the original matrix and 
                                    ## cals is 'data'.  It by default
                                    ## picks up the original matrix.
  
  
  m <- solve(data, ...)             ## This calculates the inverse of data
  
  x$setinverse(m)                   ## This sets m to be the cached value
                                    ## of the inverse availabel for future
                                    ## use.
  
  m                                 ## Outputs m, the inverse
}
  




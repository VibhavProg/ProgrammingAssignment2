## These functions are part of my code for the Week 3 prgramming assignment of 
##Coursera's Data Science R Programming course. I started this assignment on 
##the 3rd of January in the year of 2020; My GitHub username is VibhavProg

## makeCacheMatrix creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) { ##defines with a default mode of "matrix"
  inverse <- NULL ##initializes inverse as NULL, it will hold the inverse of the matrix
  setMatrix <- function(y){ ##defines the setMatrix function
    x <<- y ##value of matrix in environment
    inverse <<- NULL ##initializes inverse as NULL, it will hold the inverse of the matrix
  }
  getMatrix <- function(){ ##defines get function
    x ##returns value of argument
  }
  setInverse <- function(inverseTwo){ 
    inverse <<- inverseTwo ## assigns value of inverse in parent environment
  }
  getInverse <- function(){ 
    inverse ##gets the value of inverse where called
  }
  list(setMatrix = setMatrix, getMatrix = getMatrix,setInverse = setInverse, getInverse = getInverse) ##necessary to use $ operator
}

## cacheSolve computes the inverse of the special matrix returned by makeCacheMatrix above
cacheSolve <- function(x, ...){ 
  inverse <- x$getInverse() ##assigns the inverse from makeCacheMatrix to this new inverse holder
  if(!is.null(inverse)){ ##if loop used to check if inverse is not NULL
    return(inverse) ##if inverse is not NULL, this will return the values of the inverse of the matrix
  }
  dat <- x$getMatrix() ##This saves the original matrix
  inverse <- solve(dat, ...) ##This computes the inverse
  x$setInverse(inverse) ##This sets the inverse
  inverse ##This prints out the results
}

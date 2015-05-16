#Overall: Script allows for saving larger data sets as matrices and calculating the inverse of the stored item
#Function 1: can cach a matrix object to save computing time
#Function 2: can compute the inverse of the cached matrix


makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y  #assign a value to an object in an environment that 
    #is different from the current environment
    m<<-NULL
  }
  get<-function() x #list
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){ #! is negation, checks whether data is given in matrix
    message("getting cached data")
    return(m)
  }
  matrix<-x$get() #creates matrix
  m<-solve(matrix, ...) #inversion
  x$setmatrix(m) #adds value to cache
  m
}

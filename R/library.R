#Imports:
#       matrixStats 

#mat1 <- matrix(c(10,7,3,8,8,6,4,4,4),nrow=3,ncol=3,byrow=TRUE)
#prop <-c(0.25,0.6,0.15)


#' maximax
#'
#' This function calculated the maximax criterion
#' Maximax criterion – this decision criterion is 
#' applied by the most optimist decision make
#' when he thinks optimistically about the 
#' happening of events affecting decision.
#' If this philosophy is followed, the manager 
#' will chose that alternative under which it 
#' is possible to receive the most favourable 
#' pay-off.
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @return maximax value (not the location)
#' @export
maximax <- function(mat) {
  return(max(matrixStats::rowMaxs(mat)))
}

#' maximin
#'
#' Maximin criterion- this criterion is adopted by the 
#' most pessimistic decision maker. The manager believes 
#' that worst possible may take place.  This pessimism 
#' cause the selection of that alternative which 
#' maximizes the least favourable  payoff.
#'
#' @param mat this is alternative and state of State of Nature 1 payoff table
#' @return maximin value (not the location)
#' @export
maximin <- function(mat) {
  return(max(matrixStats::rowMins(mat)))
}

#' minimax
#'
#' Minimax criterion- minimax criterion leads to the 
#' minimization of regret. The managerial regret is 
#' define as the pay off  for each alternative under 
#' state of nature of compitative action subtracted from 
#' the most favourable payoff which is possible with the 
#' happening of the particular event. When manager chooses 
#' an alternatives and when a state of nature takes place 
#' which does not result in the most favourable payoff, 
#' regret takes place.
#'
#' @param mat this is alternative and state of State of Nature 1 payoff table
#' @return minimax value (not the location)
#' @export
minimax <- function(mat) {
  return(min(matrixStats::rowMaxs(mat)))
}

#' EMV
#'
#' The Expected Monetary Value (EMV) of a decision is the 
#' long-run average value of the outcome of that decision. 
#' In other words, if we have a decision to make, let's 
#' suppose taht we could make that exact same decicion 
#' under the exact same circumstances many, many times 
#' (obviously, we can't in real life, but suppose we could). 
#' One time a good State of nature may occur, and we would 
#' have a very positive outcome. Another time we many have a 
#' negative outcome becuase some less-favorable State of 
#' Nature happened. If, somehow, we could repeat that 
#' decision lots and lots of times, and determine the 
#' outcome for each time, and then average all those 
#' outcomes, then we would have the EMV of the decision alternative.
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return emv
#' @export
emv <- function(mat,prop) {
  return((max(mat%*%prop)))
}

#' EVwPI
#'
#' This calculates the expected value with perfect information.
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return EV with PI EV|PI
#' @export
EVwPI <- function(mat,prop) {
  return(sum(matrixStats::colMaxs(mat1)*prop))
}

#' EVPI
#'
#' This calculates the expected value of perfect information.
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return EVPI 
#' @export
EVPI <- function(mat,prop) {
  return(EVwPI(mat1,prop)-emv(mat1,prop))
}

#' Hurwicz
#'
#' The Hurwicz criterion is arguably one of the most widely used rules 
#' in decision-making under uncertainty. It allows the decision maker 
#' to simultaneously take into account the best and the worst possible 
#' outcomes, by articulating a "coefficient of optimism" that determines 
#' the emphasis on the best end.
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param alpha the Hurwicz Alpha scaler between 0 and 1. 
#' @return EVPI 
#' @export
hurwicz <-function(mat,alpha) {
  return(max(matrixStats::rowMaxs(mat)*(alpha)+(1-alpha)*matrixStats::rowMins(mat)))
}

#' treeRollUp
#'
#' This calculates the probability of a tree roll up, or (as I call it)
#' a straight probability calculation
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return probability
#' @export
treeRollup <-function(mat,prop) {
  colMeans(mat)%*%prop
}

#' regretMatrix
#'
#' This calculates the regret matrix from the payoff table. 
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @return regret Matrix (matrix object)
#' @export
regretMatrix<-function(mat) {
  abs(mat-t(matrix(matrixStats::colMaxs(mat),3,3)))
}

#' EOL
#'
#' This calculates the expected opportunity loss
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return EOL value vector
#' @export
EOL<-function(mat,prop) {
  return(abs(mat-t(matrix(matrixStats::colMaxs(mat),3,3)))%*%prop)
}

#' minEOL
#'
#' This calculates the minimum expected opportunity loss
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @param prop this is probability vecotr for each state of nature
#' @return minimum of the EOL vector
#' @export
minEOL<-function(mat,prop) {
  return(min(abs(mat-t(matrix(matrixStats::colMaxs(mat),3,3)))%*%prop))
}

#' regretminimax
#'
#' This calculates the minimax of the regret matrix
#'
#' @param mat this is alternative and state of State of Nature payoff table
#' @return minimax of the EOL 
#' @export
regretminimax<-function(mat) {
  minimax(regretMatrix(mat))
}

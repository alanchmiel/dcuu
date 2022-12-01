# dmuu
R Library for decision making under uncertainty.

The Problem of Decision Making Under Uncertainty: The problem of decision making under uncertainty is to choose an action (or decision) among many different available actions which gives (possibly) maximum expected profit or maximum expected revenue or minimum expected losses or minimum expected costs as the case may be, under uncertain situations. For each you need to have a payoff matrix with States of Nature in Columns, and Alternatives in Rows. You will also need a vector for the probabilities where the length of the vector is equal to the number of the states of nature.


The libary can be installed like so 
```
devtools::install_github("alanchmiel/dcuu")
```

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

To load the library, use:
```
library(dmuu)
```
Next we need to create a payoff table. For our example, we'll use:
```
mat1 <- matrix(c(10,7,3,8,8,6,4,4,4),nrow=3,ncol=3,byrow=TRUE)
```
The matrix would look like this:

|   |   |   |
|--:|--:|--:|
| 10|  7|  3|
|  8|  8|  6|
|  4|  4|  4|

To create the probability vector well use:
```
prop <-c(0.25,0.6,0.15)
```

The following are examples for all of the functions:

```{r}
maximax(mat1)

## [1] 10


```

```{r}
maximin(mat1)

## [1] 6
```

```{r}
minimax(mat1)

## [1] 4
```

```{r}
emv(mat1,prop)

## [1] 7.7
```

```{r}
EVwPI(mat1,prop)

## [1] 8.2
```


```{r}
EVPI(mat1,prop)

## [1] 0.5
```


```{r}
alpha<-0.8
hurwicz(mat1,alpha)

## [1] 8.6
```


```{r}
treeRollup(mat1,prop)

##          [,1]
## [1,] 6.283333
```

```{r}
regretMatrix(mat1)

##      [,1] [,2] [,3]
## [1,]    0    1    3
## [2,]    2    0    0
## [3,]    6    4    2
```

```{r}
EOL(mat1,prop)

##      [,1]
## [1,] 1.05
## [2,] 0.50
## [3,] 4.20
```


```{r}
minEOL(mat1,prop)

## [1] 0.5
```


```{r}
regretminimax(mat1)

## [1] 2
```

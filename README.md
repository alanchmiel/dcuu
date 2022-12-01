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
```

```{r}
maximin(mat1)
```

```{r}
minimax(mat1)
```

```{r}
emv(mat1,prop)
```

```{r}
EVwPI(mat1,prop)
```


```{r}
EVPI(mat1,prop)
```


```{r}
alpha<-0.8
hurwicz(mat1,alpha)
```


```{r}
treeRollup(mat1,prop)
```

```{r}
regretMatrix(mat1)
```

```{r}
EOL(mat1,prop)
```


```{r}
minEOL(mat1,prop)
```


```{r}
regretminimax(mat1)
```

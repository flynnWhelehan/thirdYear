# Covers Chapters 3, 6, 9
## Chapter 3 - Conformal prediction
In mainstream machine learning the assumption is Independent Identically Distributed.
 - labelled samples are assumed to be generated independent from the same probability measure

We want to predict with confidence - with a guaranteed validity. 

### Idea of conformal prediction: 
1. Given a training set and a test sample, try in turn each potential label for the test sample.
2. For each postulated label, we look at how plausible the extended training set is (under the IID assumption).
3. We can make a confident prediction if all but one completion looks implausible.
4. To evaluate the implausibility of the extended training set we use the statistical notion of a p-value (to be defined).

### Implementing conformal prediction
- The first step is to define a conformity measure.
   - This is a function that maps any finite sequence of labelled samples z1..zm to the corresponding conformity scores α1..αm
   - It is required to be equivariant: if we permute z1..zm, the corresponding α1..αm will be permuted in the same way.
   - The intuition behind αi : how well zi conforms to the rest of the dataset.
   - If αi is small, we say that zi is non-conforming, or strange.

An example of a conformity measure is the euclidean distance between the two samples.

- Next, (given a training set z1..zn and test sample x*) for each possible label, compute the p-value:
  - p(y = ({i = 1..n + 1 | αy,i ≤ αy,n+1})  /  n + 1 )
  - ({i = 1..n + 1 | αy,i <= αy,n+1}) can also be seen as the rank
    - rank flips depending on conformity (kth smallest) or non-conformity (kth biggest) i think
  - α are conformity scores corresponding to z (x*,y)

- Finally, compute the prediction set
  - if given a significance level ε > 0 (our target probability of error):  
    - Γε = {y ∈ Y | p(y) > ε}.
    - if nothing is in the prediction set, and the largest p-value is very low, you might have a new class!

The smallest possible value for p(y) is 1/(n+1) (which would make the sample the strangest). The most conforming sample would have p(y) = 1.

### Conformal prediction with nearest neighbour
#### Conformity measures for 1nn
- One over the distance to the nearest sample of the same class
- Combine the two ideas:
  - The distance to the nearest sample of a different class divided by the distance to the nearest sample of the same class.
#### Nonconformity
Different interpretation: αi measures how strange (rather than how conforming) zi is.
p(y = ({i = 1..n + 1 | αy,i >= αy,n+1})  /  n + 1 )

In application to regression nonconformity scores are
often more convenient.
#### Nearest neighbour regression
Perhaps the most popular class of nonconformity measures in the case of regression is
- αi = |yi − ^yi|
  - where ˆyi is a prediction for yi
Another:
- αi = |yi − ˆyi | / σi
  - where ˆyi is a prediction for yi and σi > 0 is an estimate of its accuracy. 

For above, ˆyi can be the label of the nearest neighbour of xi

The main difficulty for regression problems is that there are infinitely many potential labels to consider.
One possible solution is to consider a dense finite grid of potential labels, and then for each possible label in the grid compute its p-value.
Occasionally another solution is possible: we can derive a
formula (or a very efficient algorithm) for the prediction set.
This is the case for K Nearest Neighbours, Least Squares
regression, Ridge Regression, and Lasso (the last three
algorithms will be discussed in later chapters).

### Measuring the efficiency of conformal predictors
In case of classification, we use the average false p-value.
  - the average of the p-values for all postulated labels in the test set except for the true labels.


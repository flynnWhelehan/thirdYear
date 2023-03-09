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
   - It is required to be equivariant: if we permute z1..zm, the corresponding α1, . . . , αm will be permuted in the same way.
   - The intuition behind αi : how well zi conforms to the rest of the dataset.
   - If αi is small, we say that zi is non-conforming, or strange.


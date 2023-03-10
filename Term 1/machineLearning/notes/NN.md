- [Chapter 8](#chapter-8)
  - [Neural Networks](#neural-networks)
    - [Basics](#basics)
    - [Layers](#layers)
    - [Strengths](#strengths)
    - [Weaknesses](#weaknesses)
  - [Maximum Margin Classifiers](#maximum-margin-classifiers)
    - [Basics](#basics-1)
    - [Hyperplanes](#hyperplanes)
      - [Classifying samples using a hyperplane](#classifying-samples-using-a-hyperplane)
    - [Constructing the maximum margin classifier](#constructing-the-maximum-margin-classifier)
    - [Constructing the soft margin classifer](#constructing-the-soft-margin-classifer)
- [what about the ones closest to margin in right class?](#what-about-the-ones-closest-to-margin-in-right-class)
    - [Support vector machines](#support-vector-machines)
      - [Uses of SVMs](#uses-of-svms)
      - [Strengths of SVMs](#strengths-of-svms)
      - [Weaknesses of SVMs](#weaknesses-of-svms)
  - [SVMs on K-Classes](#svms-on-k-classes)
    - [One vs One](#one-vs-one)
    - [One vs Rest](#one-vs-rest)
      - [Using One vs Rest with conformal prediction](#using-one-vs-rest-with-conformal-prediction)

# Chapter 8
## Neural Networks
### Basics
NN are how humans think
NN can be considered as an SVM if they have one hidden layer?
### Layers
Hidden layer: (think of chatgpt (i think), one user input, billions of layers)
- takes input features x[i] through a hiddden layer h[j] nodes and gives an     output label y^ through a combination of the weights
    - w = weights between the inputs x and the hidden layer h
    - v = weights between the hidden layer h and the output ˆy 
    (see slide 5 for formula)
- activation function tanh (can differ) will restrict your real line output     between 1 and -1
    - this weight is known as b in the combination to the output
### Strengths
Strengths of NNs:
- Can capture information within large amounts of data and build complex models
### Weaknesses
Weaknesses of NNs:
- Long training time
- Careful preprocessing of data (often normalization)
- Work best with data where all features have similar meaning (homogeneous data)
- Requires careful tuning of parameters

## Maximum Margin Classifiers
### Basics
One reason why neural networks are so difficult to train is that
their performance (in regression, measured by RSS) is a complicated function of the parameters, with lots of local minima (we get stuck in these).
- local minima are point along a graph where you might assume they are min until you explore further?

Vapnik considered SVM an improved version of neural
networks (with one hidden layer) that does not have multiple
local minima. 
- The reason it does not have multiple local minima is that the function it is trying to minimize is convex.

### Hyperplanes
Used eventually to construct the maximum margin classifer.
Hyperplane is a subspace of dimension p-1 (within a p-dimensional space R^p)
We can think of the hyperplane as dividing the p-dimensional space into two halves.
- in 2-D, this is a line
- in 3-D, a plane
- in >3-D, hard to visualize

The hyperplane is an equation defined as: w dot x + b = 0
- e.g. w[0]x[0] + w[1]x[1] ... + b = 0
- = 0 as it is a single place. > or < would main a space
  - if the equation is < or >, it means that x lies on one side of the hyperplane
- assume w =! 0 btw
So, One can determine on which side of the hyperplane a point lies by calculating the sign of w · x + b. (this is our scoring/decision function)

#### Classifying samples using a hyperplane
Suppose we have a training set that consists of n training
samples x1..xn in two classes {1,-1}.
Suppose we also have a test sample x ∗.
Our goal: develop a classifier based on the training data that
will correctly classify the test sample using its features.

If a separating hyperplane exists (then infinite exist), we can use it as a classifier.
A separating hyperplane has the property that
- w · xi + b > 0 if yi = 1
- w · xi + b < 0 if yi = −1.
Equivalently, a separating hyperplane has the property that
- yi (w · xi + b) > 0
  - for all i = 1, . . . , n.

We can have some confidence in our predictions when the scoring function results in value far from zero. This means that the sample lies far from the hyperplane so is deep in the class.

Finally, in order to choose the best separating hyperplane for our classification, we use the maximum margin hyperplane. It is the hyperplane that is furthest from the training samples, which will allow most new samples to lie in each class.
Although the maximum margin classifier is often successful, it
can also lead to overfitting when p is large.
The support vectors are the samples equidistant from the hyperplane.
If the support vectors are moved, the maximum margin hyperplane moves.

There is, however, a soft margin classifer, where the line almost separates the classes, allowing a few exceptions. (reduces overfitting?)

### Constructing the maximum margin classifier
Based on a set of training samples, this is an optimisation problem 
- ||w||^2
  - (minimizing the Euclidean length of w - maximizing the margin)
- s.t. yi(w dot xi + b) >= 1 
  - (guarantees that each sample will be on the correct side of the hyperplane with some cushion)

To find the optimal separating hyperplane, we 
- Take samples of two different classes
- Find the slope (Difference between two support vectors in the same class)
- Draw lines through each class of samples
- Find the distance from one line to the other
  - Find the equation for each line 
  - ...

### Constructing the soft margin classifer
Based on a set of training samples, this is an optimisation problem 
- ||w||^2 + C∑n,i=1 ζi → min
  - ζ1, . . . , ζn are slack variables; they allow individual training samples to be on the wrong side of the margin or even hyperplane.
  - C reflects the importance we attach to classifying training samples well. It determines the number and severity of the violations to the margin (and to the hyperplane) that we will tolerate.
  - If C = ∞ we do not tolerate any violations to the margin, and we must have ζ1 = · · · = ζn = 0
- s.t. yi (w · xi + b) ≥ 1 − ζi , ζi ≥ 0, i = 1, . . . , n, where C is a positive parameter
  - (guarantees that each sample will be on the correct side of the hyperplane with some cushion)

Our optimization problem now reduces to the old optimal
separating hyperplane optimization problem

Now, samples that either lie on the margin or violate the margin will affect the hyperplane. The support vectors are therefore the samples that lie directly on the margin, or on the wrong side of the margin for their class.?? 
# what about the ones closest to margin in right class?

The soft margin classifier works well if the boundary between the two classes is linear. (see slide 51)

### Support vector machines
SVM is based on that the soft margin optimization problem can be rewritten to involve only the dot products of the training samples (as opposed to the samples themselves).
To apply this solution to a test sample, we only need to know the dot products of the training samples and the test sample. Therefore, we can apply the kernel trick. This way we obtain a support vector machine (or SVM).

The prediction for any test sample x depends only on the support vectors.

When the soft margin classifier is combined with a kernel (especially non-linear, such as polynomial), the resulting classifier is known as a support vector machine.

#### Uses of SVMs
- Health forecasting.
- Estimating risk in financial markets.
- Predicting attendance of marketing events.
- Calculating weather risks.
- Forecasting advertising revenues.

#### Strengths of SVMs
- Support vector machines are powerful models and perform well on a variety of datasets. They allow for complex decision boundaries, even if the data has only a few features. They work well on low-dimensional and high-dimensional data (i.e., few and many features).

#### Weaknesses of SVMs
- They don’t scale very well with the number of samples. Running an SVM on data with up to 10,000 samples might work well, but working with datasets of size 100,000 or more can become challenging in terms of runtime and memory usage
- They require careful preprocessing of the data and tuning of the parameters.
- SVM models are hard to inspect; it can be difficult to understand why a particular prediction was made, and it might be tricky to explain the model to a nonexpert (or even an expert).
- Like neural nets, they work best with “homogeneous” data.

## SVMs on K-Classes
Though a number of proposals for extending SVMs to the K-class case have been made, the two most popular are the one-vs-one and one-vs-rest approaches.
### One vs One
constructs K (K − 1)/2 SVMs, each of which compares a pair of classes.
We classify a test sample using each of the K (K − 1)/2 classifiers, and we tally the number of times that the test sample is assigned to each of the K classes.
The final classification is performed by assigning the test
sample to the class to which it was most frequently assigned
in these K (K − 1)/2 pairwise classifications.
### One vs Rest
We fit K SVMs, each time comparing one of the K classes to the remaining K − 1 classes.
Let fk denote the scoring function that results from fitting an SVM comparing class k (coded as +1) to the others (coded as −1).

In one-vs-rest, we assign the sample to the class for which
fk (x ∗) is largest (as this amounts to the highest level of
confidence that the test sample belongs to class k).
(Let x ∗ denote a test sample)
#### Using One vs Rest with conformal prediction
We can use the idea of one-vs-rest to define an inductive
conformity measure A(ζ, (x , y )).
Remember: A(ζ, (x , y )) measures how well the labelled
sample (x , y ) conforms to ζ.
Train K SVMs on ζ getting K scoring functions fk (although
we will use only one of them).
Set A(ζ, (x , y )) = fy (x ).
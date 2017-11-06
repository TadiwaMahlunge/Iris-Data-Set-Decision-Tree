# Classification Table algorithm
In this algorithm I allow splits on attributes to reduce entropy similarly to within decision trees. However, I do not require attributes not be reused like in the trees. This way I am able to split data until it subsets all have the same classifier. 

Note: This will only work with high accuracy, but only on normally and identically distributed data sets of any size; I use the quartiles when splitting the data sets along attributes and so I know there will not be overfitting for this reason. I would have used one and two standard deviations from the mean for splits however for algorithm speed I avoided this. Note, the test set need not be identical to the training set but obey the same distribution.

It should be noted, I began this short project trying to implement a decision tree, however, when I was told there was no actual guarantee of proper classification, I grew irritated and adapted my previous solution to make sure we could classify a data set under the above parameters.

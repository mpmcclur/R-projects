# Intro
The Federalist Papers dataset (https://www.kaggle.com/morenoh149/the-federalist-papers) is explored with the intent to classify the "disputed" papers into one of the three authors: Hamilton, Madison, or Jay. 

In "Decision Tree.Rmd", I build a decision tree model, after which I apply pre-pruning and post-pruning methods to account for the more nuanced complexities in the data, such as implementing a complexity parameter (CP).

In "K-means Clustering.Rmd", I use k-means clustering to classify the authors, based on four distinct clusters, as indicated by an elbow test. I compare this result with a model based on complete-link hierarchical agglomerative clustering (HAC) to note any similarities or dissmiliarities among the clusters.

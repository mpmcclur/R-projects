# Intro
The Federalist Papers dataset (https://www.kaggle.com/morenoh149/the-federalist-papers) is explored with the intent to classify the "disputed" papers into one of the three authors: Hamilton, Madison, or Jay. 

In "Decision Tree.Rmd", I build a decision tree model, after which I apply pre-pruning and post-pruning methods to account for the more nuanced complexities in the data, such as implementing a complexity parameter (CP).

In "Decision Tree versus Naive Bayes.Rmd", I again build a decision tree (DT) but also create a Naive Bayes (NB) model and compare the accuracies of the model through percentages produced by a confusion matrix. The NB model, though not satisfactorily accurate, proved to be more accurate than the DT model.

In "K-means Clustering.Rmd", I use k-means clustering to classify the authors, based on four distinct clusters, as indicated by an elbow test. I compare this result with a model based on complete-link hierarchical agglomerative clustering (HAC) to note any similarities or dissmiliarities among the clusters.

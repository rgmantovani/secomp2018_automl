library(OpenML)
library(mlr)

# List OpenML data sets.
cat("OpenML datasets: ...\n")
list_datasets = listOMLDataSets()
print(head(list_datasets))
cat("\n\n")

# Get a dataset
# more information https://www.openml.org/search?q=cancer&type=data
data_obj = getOMLDataSet(data.id=61)
dataset = data_obj$data

# classification
task = makeClassifTask(data = dataset, target = "class")
cat("Classification Task: ...\n")
print(task)
cat("\n\n")

# Classification algorithm
classif.rf = makeLearner("classif.randomForest")

### Holdout estimation
rdesc = makeResampleDesc("CV", iters=5)

### Calculate the performance
r = resample(learner=classif.rf, task=task, resampling=rdesc,
             measures=list(acc, bac), show.info = TRUE)

pred = getRRPredictions(r)
print(pred)



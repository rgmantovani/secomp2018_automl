library(OpenML)
library(mlr)

# List OpenML data sets.
list_datasets = listOMLDataSets()
print(head(list_datasets))

# Get a dataset
# more information https://www.openml.org/search?q=cancer&type=data
data_obj = getOMLDataSet(data.id=15)
dataset = data_obj$data

# dataset exploration
dimension = dim(dataset)
cat("lin=",dimension[1]," col=", dimension[2], "\n")
summary(dataset)
barplot(table(dataset$Class))

# classification


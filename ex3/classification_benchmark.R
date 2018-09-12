library(OpenML)
library(mlr)
library(ggplot2)

# Get a dataset
# more information https://www.openml.org/search?q=cancer&type=data
data_obj = getOMLDataSet(data.id=61)
dataset = data_obj$data

# classification
task = makeClassifTask(data = dataset, target = "class")

# Create a list of learners
lrns = list(
  makeLearner("classif.lda", id = "knn"),
  makeLearner("classif.lda", id = "svm"),
  makeLearner("classif.rpart", id = "rpart"),
  makeLearner("classif.randomForest", id = "randomForest")
)

### 10-fold cross validation
rdesc = makeResampleDesc("CV", iters = 10)
me = list(acc, bac)
bmr = benchmark(lrns, task, rdesc, me, show.info = TRUE)
print(bmr)

img = plotBMRBoxplots(bmr, measure = bac, style = "violin", pretty.names = FALSE, 
  order.lrn = getBMRLearnerIds(bmr)) +
  aes(color = learner.id) +
  theme(strip.text.x = element_text(size = 8))
img



######################################
# for multiple datasets

# Get a datasets
# more information https://www.openml.org/search?q=cancer&type=data
data1 = getOMLDataSet(data.id=61)$data
data2 = getOMLDataSet(data.id=1557)$data
data3 = getOMLDataSet(data.id=1499)$data
data4 = getOMLDataSet(data.id=54)$data

# classification
task1 = makeClassifTask(data = data1, target = "class")
task2 = makeClassifTask(data = data2, target = "Class")
task3 = makeClassifTask(data = data3, target = "Class")
task4 = makeClassifTask(data = data4, target = "Class")
tasks = list(task1, task2, task3, task4)

# Create a list of learners
lrns = list(
  makeLearner("classif.lda", id = "knn"),
  makeLearner("classif.lda", id = "svm"),
  makeLearner("classif.rpart", id = "rpart"),
  makeLearner("classif.randomForest", id = "randomForest")
)

### 10-fold cross validation
rdesc = makeResampleDesc("CV", iters = 10)
me = list(acc, bac)
bmr = benchmark(lrns, tasks, rdesc, me, show.info = TRUE)
print(bmr)

img = plotBMRBoxplots(bmr, measure = bac, style = "violin", pretty.names = FALSE, 
  order.lrn = getBMRLearnerIds(bmr)) +
  aes(color = learner.id) +
  theme(strip.text.x = element_text(size = 8))
img


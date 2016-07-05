# Author : Rajasekhar Jetty
setwd("E:/Kaggle/DSC_Sessions/Session_2")

# for installing the package 
# install.packages('h2o')

# Loading the library 
library(h2o)

# starting the h2o server 
h2o.init(nthreads=-1,ip = "127.0.0.1", port = 54321,max_mem_size='4g')

# Taking the iris dataset and Importing it in to the H2O cloud.
iris.hex <- as.h2o(iris)

# checking the summary of the dataset
summary(iris.hex)


# Exploratory Data Analysis needs to be done ,since that is not the agenda of the session we are leaving it.


# Understanding the predictors and response variables

iris.hex[,5]<-as.factor(iris.hex[,5])

# Applying a random Forest model 
my_model <- h2o.randomForest(x=1:4, 
                             y=5,
                             ntrees = 250,
                             max_depth = 10,
                             mtries=2,
                             balance_classes=FALSE,
                             training_frame=iris.hex)

# Understanding the model 
my_model@model$training_metrics


# Applying a random Forest model
my_model <- h2o.gbm(x=1:4, y=5,
                    ntrees = 50,
                    max_depth = 6,
                    balance_classes=FALSE,
                    training_frame=iris.hex)


# Understanding the model 
my_model@model$training_metrics



# Splitting the data in to train and test set 
validation_index<-sample(1:nrow(iris),0.25*nrow(iris))
training_index<-c(1:nrow(iris))[-validation_index]


# Training model on the training data

my_model <- h2o.gbm(x=1:4, y=5,
                    ntrees = 50,
                    max_depth = 6,
                    balance_classes=FALSE,
                    training_frame=iris.hex[training_index,],
                    validation_frame = iris.hex[validation_index,])

my_model@model$validation_metrics





# making predictions on the validation data,(not included in training)
pred<- h2o.predict(my_model,iris.hex[validation_index,])





# K fold cross validation is generally used to check how the model performs on the new data

my_model <- h2o.randomForest(x=1:4, 
                             y=5,
                             ntrees = 250,
                             max_depth = 10,
                             mtries=2,
                             balance_classes=FALSE,
                             training_frame=iris.hex,
                             nfolds=5,
                             keep_cross_validation_predictions = TRUE)

my_model@model$cross_validation_metrics

# Confusion matrix for 5 fold cross validation 
h2o.confusionMatrix(my_model@model$cross_validation_metrics)





# Download the POJO, for deployment 
h2o.download_pojo(my_model, getwd(), getjar = FALSE )

# writing dataframe to work with it in WEB UI
write.csv(file="iris.csv",iris,row.names=FALSE)

# shut down H2o
h2o.shutdown()

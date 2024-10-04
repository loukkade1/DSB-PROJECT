## recap ML workflow (simple)
## 1. Split Data
## 2. Train data
## 3. Test Score (predict test data)
## 4. Evaluate model (train error vs. test error)

library(tidyverse)
library(caret)
library(mlbench)

##load data
mtcars

## split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size=0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## train a linear regression model, use boostrap as a default
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm") #linear model (lm)
## train knn model
set.seed(42)
knn_model <- train(mpg ~ hp + wt + am,
                   data = train_df,
                   method = "knn")

## score
p_test <- predict(lm_model, newdata = test_df)
p_test_knn <- predict(knn_model, newdata = test_df)

## evaluate MAE, MSE, RMSE
error <- test_df$mpg - p_test
error_knn <- error <- test_df$mpg - p_test_knn

mae <- mean(abs(error))
mae_knn <- mean(abs(error_knn))

mse <- mean(error**2)
mse_knn <- mean(error_knn**2)

rmse <- sqrt(mean(error))
rmse_knn <- sqrt(mean(error_knn))

# split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = 0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## make things easier by creating function for split data
split_data <- function(data){
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size = 0.7*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return( list(train = train_df, # this line is important 
               test = test_df))
}

prep_df <- split_data(mtcars)

## k-fold cross validation(golden standard)
#knn = k nearest neighbor (the closet k)

set.seed(42) 
grid_k <- data.frame(k = c(3,5))
ctrl <- trainControl(method = "cv",
                     number = 5, #k value
                     verboseIter = TRUE) 
knn <- train(mpg ~ .,               
             data = prep_df$train,
             method = "knn",#train data
             metric = "RMSE",     #we can choose the metric among RMSE, MAE, Rsqaured after we run knn variable
             trControl = ctrl,
             tuneLength = 3)#random k

# Recommendation "Repeated k-fold cv" we train model over and over again
#The better version of k-fold,

ctrl <- trainControl(method = "repeatedcv",
                     number = 5, #k value
                     repeats = 5, 
                     verboseIter = TRUE) 
knn <- train(mpg ~ .,               
             data = prep_df$train,
             method = "knn",#train data
             metric = "RMSE",     #we can choose the metric among RMSE, MAE, Rsqaured after we run knn variable
             trControl = ctrl,
             tuneLength = 3)#random k









# source : https://thinkr.fr/premiers-pas-en-machine-learning-avec-r-volume-2-la-classification/
# github : https://github.com/blaadr/r-scoring

# installation des packages nécessaires
install.packages("tidyverse")
install.packages("rpart")
install.packages("caret")

# Chargement des packages du tidyverse, et du jeu de données
library(tidyverse)
titanic <- read_csv("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.csv")

#Séparation jeu de données
set.seed(2811)
train <- titanic %>% sample_frac(0.8)
test <- anti_join(titanic, train)

# test de train sur de l'univarié
library(rpart)
library(caret)
tree <- rpart(survived ~ sex, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
test$prediction <- as.factor(test$prediction)
test$survived <- as.factor(test$survived)
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]
;
tree <- rpart(survived ~ pclass, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]
 
tree <- rpart(survived ~ age, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]


#Prédiction multivariée

tree <- rpart(survived ~ sex + pclass, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]

tree <- rpart(survived ~ sex + pclass + parch, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]

tree <- rpart(survived ~ sex + pclass + parch + embarked, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]

tree <- rpart(survived ~ sex + pclass + parch + embarked + sibsp, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]

tree <- rpart(survived ~ sex + pclass + parch + embarked + sibsp + fare, data = train, method = "class") 
test$prediction <- predict(tree, test, type = "class")
conf <- confusionMatrix(data = test$prediction, reference = test$survived)
conf$byClass["Sensitivity"]
conf$byClass["Specificity"]

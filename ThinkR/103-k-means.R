# source : https://thinkr.fr/premiers-pas-en-machine-learning-avec-r-volume-3-k-means-clustering/
# github : https://github.com/blaadr/r-scoring

library(tidyverse)
dataset <- read_csv("basketball_player_allstar.csv")
support <- dataset %>% 
  select(minutes, points, rebounds, assists, fg_attempted, fg_made, ft_attempted, ft_made) %>% 
  na.omit()

# entrainement d'un 1er k-mans à 5 clusters
set.seed(2811)
km_model <- support %>% 
  kmeans(centers = 5, nstart=20)
support$cluster <- km_model$cluster
ggplohttps://thinkr.fr/premiers-pas-en-machine-learning-avec-r-volume-4-random-forest/t(support, aes(minutes, points, col = factor(cluster))) + 
  geom_point(size = 2, alpha = 0.8, position = "jitter")


# choix du meilleur nombre de cluster
ratio_ss <- data.frame(cluster = seq(from = 1, to = 9, by = 1)) 
for (k in 1:9) {
  km_model <- kmeans(support, k, nstart = 20)
  ratio_ss$ratio[k] <- km_model$tot.withinss / km_model$totss
}

ggplot(ratio_ss, aes(cluster, ratio)) + 
  geom_line() +
  geom_point()
# coude entre 2 et 3

# on checke les 2 modèles du coup
km_model <- support %>% 
  kmeans(centers = 2, nstart=20)
support$cluster <- km_model$cluster
ggplot(support, aes(minutes, points, col = factor(cluster))) + 
  geom_point(size = 2, alpha = 0.8, position = "jitter")

km_model <- support %>% 
  kmeans(centers = 3, nstart=20)
support$cluster <- km_model$cluster
ggplot(support, aes(minutes, points, col = factor(cluster))) + 
  geom_point(size = 2, alpha = 0.8, position = "jitter")

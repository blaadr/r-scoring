# source : https://thinkr.fr/premiers-pas-en-machine-learning-avec-r-volume-3-k-means-clustering/
# github : https://github.com/blaadr/r-scoring

library(tidyverse)
dataset <- read_csv("basketball_player_allstar.csv")
support <- dataset %>% 
  select(minutes, points, rebounds, assists, fg_attempted, fg_made, ft_attempted, ft_made) %>% 
  na.omit()
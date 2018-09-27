# source : https://thinkr.fr/premiers-pas-en-machine-learning-avec-r-volume-4-random-forest/
# github : https://github.com/blaadr/r-scoring

# install.packages("randomForest") 
library(randomForest)

library(tidyverse)
educ <- read.csv2("https://data.education.gouv.fr/explore/dataset/fr-en-effectifs-des-personnels-des-ecoles-et-etablissements-du-2nd-degre/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true")
set.seed(2811)

# on limite à l'académie de Rennes parce que sinon c'est gros pour l'exemple
educ_small <- educ %>%
  filter(Académie == "RENNES") %>%
  select(Type.d.établissement, Secteur.d.enseignement,
         Groupe.de.personnels, Titulaire, Sexe, Borne.inférieure.de.la.tranche.d.âge, Nombre.d.agents, 
         Code.région)

sum(educ_small$Nombre.d.agents)

nrow(educ_small)

# Alors là on fait un truc couillu : on multiplie les lignes pour faire une ligne par agent en fonction du sexe
educ_small <- educ_small %>% 
  mutate(Idx = 1:n()) %>% 
  group_by(Idx) %>%
  mutate( Agent = list(rep( Sexe, Nombre.d.agents) ) ) %>%
  unnest() %>%
  ungroup()
select(-Idx)

nrow(educ_small)



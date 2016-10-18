#Load Packages
library(tidyverse)
library(psych)
library(haven)
library(apaTables)
library(dplyr)

#Load Data
raw_data <- read_csv(file="raw_data.csv")

#Fix Data
raw_data <- read_csv(file="raw_data.csv",na=c("","NA"))

#Labelling Data
categorical_variables <- select(raw_data, sex)
categorical_variables$sex <- as.factor(categorical_variables$sex)
levels(categorical_variables$sex) <- list("Male"=1,"Female"=2)
sex <- categorical_variables$sex

#Creating sets of scale items
neg_affect <- select (raw_data, afraid, angry, anxious, ashamed)
pos_affect <- select (raw_data, delighted, elated, enthusiastic, excited)
Neuroticism <- raw_data$Neuroticism
Extraversion <- raw_data$Extraversion

#Checking for out of range values
psych::describe(neg_affect)
psych::describe(pos_affect)
psych::describe(Neuroticism)
psych::describe(Extraversion)

#Fixing Bad Values
is_bad_value <- neg_affect<0 | neg_affect>3
neg_affect[is_bad_value] <- NA



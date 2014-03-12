# 
# >> What's the specific question we're doing for research-y things?
# Lets do:
#   Pyelonephritis
# Demographics thereof
# Antibiotics treated with
# Yield of Blood Culture
# Yield of Urine Culture
# 
# >> What data is needed ?
# Stuff on people with diagnosis = pyelonephritis
# 
# >>What would the outputs actually be/look like?
# Table of demographics, LOS
# Table showing investigations done: e.g N(%) had Blood culture (Pos/Neg), N(%) Urine Culture (Pos/Neg), had Ultrasound
# Graph/Table showing organisms
# Graph/Table showing antibiotics

setwd("/home/david/src/ohc/scratch/audit")
library(ggplot2)

episodes <- read.csv("data/episodes.csv")
episodes$age <- as.integer((Sys.Date() - as.Date(episodes$date.of.birth) )/365)
episodes$length.of.stay <- as.integer(as.Date(episodes$discharge.date) - as.Date(episodes$date.of.admission))

ggplot(episodes, aes(age)) + geom_bar(fill="red", colour="black") + labs(title="Age distribution")
ggplot(episodes, aes(length.of.stay))+ geom_bar(fill="red", colour="black") + labs(title="Length Of Stay", x="Days")
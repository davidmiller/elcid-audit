library(RJSONIO)

audit <- fromJSON("/home/david/Downloads/audit (3).json")

micro <- 1
id <- 9 
hiv <- 12
tropical <- 15
id.liaison <- 11

tag <- micro
frist <- audit[tag]

tag_name <- frist[[1]]$tag_name
num.episodes <- frist[[1]]$num_patients
ages <- data.frame(frist[[1]]$ages)
names(ages) <- "num"
ages$age <- as.integer(rownames(ages))

stay <- data.frame(frist[[1]]$length_of_stay)
names(stay) <- "num"
stay$days <- as.integer(rownames(stay))

diagnoses <- data.frame(frist[[1]]$diagnoses)
names(diagnoses) <- "num"
diagnoses$diagnosis <- rownames(diagnoses)
diagnoses <- diagnoses[diagnoses$diagnosis != "",]

png(paste0("/home/david/Downloads/opalextracts/age.distribution.", tag_name, ".png"))
ggplot(ages, aes(y=num, x=age)) + 
  geom_smooth(aes(group="num"), color="black") +
  geom_histogram(binwidth=.5, fill="red", colour="black", stat="identity")  +
  scale_x_discrete(breaks=c(0, 10, 20, 30, 40, 50, 60, 70, 80)) +
  labs(title=paste0("Age Distribution for ", tag_name, " (", num.episodes, " patients)"), x="Age", y="Frequency")
dev.off()

png(paste0("/home/david/Downloads/opalextracts/stay.distribution.", tag_name, ".png"))
ggplot(stay[with(stay, order(days)),], aes(y=num, x=days)) + 
  geom_smooth(aes(group="num"), color="black") +
  geom_histogram(binwidth=.5, fill="red", colour="black", stat="identity")  +  
  labs(title=paste0("Length Of Stay Distribution for ",tag_name, " (", num.episodes, " patients)"), x="Days", y="Frequency") + 
  xlim(0, 60)
dev.off()

png(paste0("/home/david/Downloads/opalextracts/diagnosis.distribution.", tag_name, ".png"))
ggplot(diagnoses[diagnoses$num > 1,], aes(y=num, x=diagnosis)) + 
  geom_bar(stat="identity", width=.5, colour="black", fill="red") + 
  labs(title=paste0("Conditions with > 1 diagnosis - ", tag_name, " (", num.episodes, " patients)")) +
  theme(axis.text.x=element_text(angle = 40, hjust = 1))
dev.off()
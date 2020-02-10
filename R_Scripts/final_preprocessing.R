# Filter for same players
names <- c(as.character(data$players.left.name), as.character(data$players.right.name))
length(unique(names))

write.csv(data, file = "processed_data.csv")

data3 <- data[is.finite(data$level_discrepancy) == FALSE,]

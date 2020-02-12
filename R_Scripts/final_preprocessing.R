# Filter for same players
names <- c(as.character(data$players.left.name), as.character(data$players.right.name))
length(unique(names))

data <- data %>%
  select(-X, -X.1)

write.csv(data, file = "processed_data.csv")

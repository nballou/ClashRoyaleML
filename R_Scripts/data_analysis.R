library(dplyr)
library(plyr)
library(stringr)

data <- read.csv("matches_full.csv")

# Make smaller subset of data for testing
# data <- data %>%
#  slice(1:10)

# Filter Only Ladder Matches
data = subset(data, data$type == "ladder")

# Better winner calculation
data$left.result <- as.numeric(substring(data$result, 3, 3))
data$right.result <- as.numeric(substring(data$result, 8, 8))

data$winner[data$left.result > data$right.result] = "left"
data$winner[data$left.result < data$right.result] = "right"
data$winner[data$left.result == data$right.result] = "draw"

# Filter out draws
data = subset(data, data$left.result != data$right.result)

data$trophy.discrepancy <- data$players.left.trophy-data$players.right.trophy



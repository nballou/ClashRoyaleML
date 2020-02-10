library(ggplot2)

all_trophies <- as.vector(as.matrix(data[,c("players.left.trophy","players.right.trophy")]))
all_levels <- as.vector(as.matrix(data[,c("avg_lvl_L","avg_lvl_R")]))

hist(c(data$players.left.trophy, data$players.right.trophy))
hist(abs(data$level_discrepancy), breaks = 30)
hist(c(data$avg_lvl_L,data$avg_lvl_R))

# Histogram of ranks
ggplot() + aes(all_trophies) +
  geom_histogram(fill = "blue") +
  geom_vline(aes(xintercept=mean(all_trophies)), color="black", linetype="dashed", size=1) +
  theme(plot.title = element_text(hjust = 0.5))

# Histogram of average card levels
ggplot() + aes(all_levels) +
  geom_histogram(fill = "blue") +
  geom_vline(aes(xintercept=mean(all_levels)), color="black", linetype="dashed", size=1) +
  ggtitle("Average Card Level (Max: 13)") +
  theme(plot.title = element_text(hjust = 0.5))

# Historgram of level discrepancies
ggplot(data = data, aes(x = abs(level_discrepancy))) +
  geom_histogram(bins = 30, fill = "forestgreen") +
  ggtitle("Difference in Card Levels") +
  theme(plot.title = element_text(hjust = 0.5))


# Barplot of Winrates
ggplot(data=winrates, aes(x = reorder(Card, -Winrate), y = Winrate, fill = reorder(Card, -Winrate))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#  coord_cartesian(ylim = c(0.39,0.53))

# Barplot of Userates
ggplot(data=winrates, aes(x = reorder(Card, -Use_rate), y = Use_rate, fill = reorder(Card, -Use_rate))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# L1 regularization
# PCA
# Check for collinearity somehow (VIF?
# in another universe—genetic algorithm for optimal threshold)

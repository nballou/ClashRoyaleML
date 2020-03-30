library(ggplot2)

# Function (pulled from SO which modifies the legend in the plot based on a desired color square size, text size, and spacing.
addSmallLegend <- function(myPlot, pointSize = 0.5, textSize = 3, spaceLegend = 0.1, num_columns = 2, num_rows = 38) {
  myPlot +
    guides(shape = guide_legend(override.aes = list(size = pointSize)),
           color = guide_legend(override.aes = list(size = pointSize)),
           fill = guide_legend(ncol = num_columns, nrow = num_rows)) +
    theme(legend.title = element_text(size = textSize),
          legend.text  = element_text(size = textSize),
          legend.key.size = unit(spaceLegend, "lines"))
}

# Needed in order to combine the two columns for left and right players, which are in the same row of the df
all_trophies <- as.vector(as.matrix(data[,c("players.left.trophy","players.right.trophy")]))
all_levels <- as.vector(as.matrix(data[,c("avg_lvl_L","avg_lvl_R")]))

hist(c(data$players.left.trophy, data$players.right.trophy))
hist(abs(data$level_discrepancy), breaks = 30)
hist(c(data$avg_lvl_L,data$avg_lvl_R))

# Histogram of ranks
ggplot() + aes(all_trophies) +
  geom_histogram(bins = 100) +
  # geom_vline(aes(xintercept=mean(all_trophies)), color="black", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=4000, color="red", linetype = "solid"), size = 1) +
  geom_vline(aes(xintercept=6000, color="red", linetype = "solid"), size = 1) +
  xlab("Trophy count") +
  ylab("Frequency") +
  theme(plot.title.position = "plot",
        plot.title = element_text(size = 18),
        text = element_text(family = "Times New Roman"),
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 14),
        legend.position = "none")

ggsave("../plots/trophy_hist.png", device = "png", dpi = 300)

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

ggplot(data = data, aes(x = abs(trophy.discrepancy))) +
  geom_histogram(bins = 30, fill = "forestgreen") +
  ggtitle("Difference in Trophies") +
  theme(plot.title = element_text(hjust = 0.5))

# Barplot of Winrates
p_winrate <- ggplot(data=winrates, aes(x = reorder(Card, -Winrate), y = Winrate, fill = reorder(Card, -Winrate))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), plot.title = element_text(size = 24, face = "bold", hjust = 0.5)) +
  ggtitle("Winrate by Card") +
  labs(fill = "Card Name") +
  xlab("Card Name") +
  coord_cartesian(ylim = c(0.35,0.55))

addSmallLegend(p_winrate, pointSize = 5, textSize = 11, spaceLegend = 1)

# Barplot of Winrates
p_userate <- ggplot(data=winrates, aes(x = reorder(Card, -Use_rate), y = Use_rate, fill = reorder(Card, -Use_rate))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), plot.title = element_text(size = 24, face = "bold", hjust = 0.5)) +
  ggtitle("Use Rate by Card") +
  labs(fill = "Card Name") +
  xlab("Card Name") +
  coord_cartesian(ylim = c(0,0.46))

addSmallLegend(p_userate, pointSize = 5, textSize = 11, spaceLegend = 1)

# Barplot of Userate, ordered in the same way as winrate
p_userate2 <- ggplot(data = winrates, aes(x = reorder(Card, -Winrate), y = Use_rate, fill = reorder(Card, -Winrate))) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1), plot.title = element_text(size = 24, face = "bold", hjust = 0.5)) +
  ggtitle("Userate by Card") +
  labs(fill = "Card Name") +
  xlab("Card Name") +
  coord_cartesian(ylim = c(0,0.46))

addSmallLegend(p_userate2, pointSize = 5, textSize = 11, spaceLegend = 1)

# L1 regularization
# PCA
# Check for collinearity somehow (VIF?)
# in another universe—genetic algorithm for optimal threshold)

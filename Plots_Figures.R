hist(c(data$players.left.trophy, data$players.right.trophy))

hist(abs(data$level_discrepancy), breaks = 30)

hist(c(data$avg_lvl_L,data$avg_lvl_R))


scaled_data <- data %>%
  mutate_if(is.numeric, scale)

# Filter for same players
names <- c(as.character(data$players.left.name), as.character(data$players.right.name))
length(unique(names))

write.csv(data, file = "processed_data.csv")

lm1 <- lm(does_left_win ~ trophy.discrepancy + level_discrepancy, data = scaled_data)
summary(lm1)

glm1 <- glm(does_left_win ~ trophy.discrepancy + level_discrepancy, data = scaled_data, family=binomial(link = "logit"))
summary(glm1)

scaled_data$does_left_win <- ifelse(data$winner == "left", 1, 0)
# pick rates graudally decrease or intercept suddenly changes?



# L1 regularization
# PCA
# Check for collinearity somehow (VIF?
# in another universe—genetic algorithm for optimal threshold)

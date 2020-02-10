scaled_data <- data %>%
  mutate_if(is.numeric, scale)


lm1 <- lm(does_left_win ~ trophy.discrepancy + level_discrepancy, data = scaled_data)
summary(lm1)

glm1 <- glm(does_left_win ~ trophy.discrepancy + level_discrepancy, data = scaled_data, family=binomial(link = "logit"))
summary(glm1)

scaled_data$does_left_win <- ifelse(data$winner == "left", 1, 0)

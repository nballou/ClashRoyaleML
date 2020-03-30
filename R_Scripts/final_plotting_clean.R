library(ggplot2)
library(dplyr)

logreg_10 <- read.csv("../data_clean/logreg_q10_r10_stats.csv")
logreg_20 <- read.csv("../data_clean/logreg_q20_r10_stats.csv")
logreg_50 <- read.csv("../data_clean/logreg_q50_r10_stats.csv")
logreg_100 <- read.csv("../data_clean/logreg_q100_r10_stats.csv")

mlp_10 <- read.csv("../data_clean/mlp_q10_r10_stats.csv")
mlp_20 <- read.csv("../data_clean/mlp_q20_r10_stats.csv")
mlp_50 <- read.csv("../data_clean/mlp_q50_r10_stats.csv")
mlp_100 <- read.csv("../data_clean/mlp_q100_r10_stats.csv")

logreg_10$num_bins <- "10"
logreg_20$num_bins <- "20"
logreg_50$num_bins <- "50"
logreg_100$num_bins <- "100"

logreg_10$model<- "Logistic Regression"
logreg_20$model<- "Logistic Regression"
logreg_50$model<- "Logistic Regression"
logreg_100$model <- "Logistic Regression"

mlp_10$num_bins <- "10"
mlp_20$num_bins <- "20"
mlp_50$num_bins <- "50"
mlp_100$num_bins <- "100"

mlp_10$model<- "MLP"
mlp_20$model<- "MLP"
mlp_50$model<- "MLP"
mlp_100$model <- "MLP"

all_data <- rbind(logreg_10, logreg_20, logreg_50, logreg_100, mlp_10, mlp_20, mlp_50, mlp_100)

# Plot log reg and mlp together, 20 split
ggplot(data = all_data[all_data$num_bins == "20",], aes(x = avg, y = test.acc, color = model)) +
  geom_point() +
  geom_smooth(method='glm', formula = y~x) +
  stat_smooth(method = "lm", formula = y ~ poly(x, 2)) +
  xlab("Trophy average in bin") +
  ylab("Test accuracy (average of 10 runs)") +
  coord_cartesian(ylim = c(.5, .92)) +
  # ggtitle("Test Accuracy by Bin") +
  theme(plot.title.position = "plot",
        plot.title = element_text(size = 18),
        axis.title = element_text(size = 14),
        text = element_text(family = "Times New Roman"),
        legend.position="top",
        legend.title = element_text(color="black", size=14, face="bold"),
        legend.text = element_text(size = 14),
        axis.text = element_text(size = 14)) +
  labs(color = element_blank())

ggsave("../plots/test_acc_linreg.png", device = "png", dpi = 300)

# Plot log reg and mlp together, all splits
ggplot(data = all_data, aes(x = avg, y = test.acc, shape = model, color = num_bins)) +
  geom_point() +
  geom_smooth(method='glm', formula = y~x) +
  xlab("Trophy average in bin") +
  ylab("Test accuracy") +
  coord_cartesian(ylim = c(.5, .92)) +
  # ggtitle("Test Accuracy by Bin") +
  theme(plot.title.position = "plot",
        plot.title = element_text(size = 18),
        axis.title = element_text(size = 14),
        text = element_text(family = "Times New Roman"),
        legend.position="top",
        legend.title = element_text(color="black", size=14, face="bold"),
        legend.text = element_text(size = 14),
        axis.text = element_text(size = 14)) +
  labs(color = element_blank(), shape = element_blank())


# linear regression models
all_data <- all_data %>% mutate_if(is.numeric, scale)

logreg_10.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "Logistic Regression" & all_data$num_bins == "10",])
summary(logreg_10.m)
confint(logreg_10.m)

logreg_20.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "Logistic Regression" & all_data$num_bins == "20",])
summary(logreg_20.m)
confint(logreg_20.m)

logreg_50.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "Logistic Regression" & all_data$num_bins == "50",])
summary(logreg_50.m)
confint(logreg_50.m)

logreg_100.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "Logistic Regression" & all_data$num_bins == "100",])
summary(logreg_100.m)
confint(logreg_100.m)

# MLP
mlp_10.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "MLP" & all_data$num_bins == "10",])
summary(mlp_10.m)
confint(mlp_10.m)

mlp_20.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "MLP" & all_data$num_bins == "20",])
summary(mlp_20.m)
confint(mlp_20.m)

mlp_50.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "MLP" & all_data$num_bins == "50",])
summary(mlp_50.m)
confint(mlp_50.m)

mlp_100.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "MLP" & all_data$num_bins == "100",])
summary(mlp_100.m)
confint(mlp_100.m)

# Polynomial regression
mlp.20.quad <- lm(test.acc ~ poly(avg, 2), data = all_data[all_data$model == "MLP" & all_data$num_bins == "20",])
summary(mlp.20.quad)

mlp.100.quad <- lm(test.acc ~ poly(avg, 2), data = all_data[all_data$model == "MLP" & all_data$num_bins == "100",])
summary(mlp.100.quad)


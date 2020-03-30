library(dplyr)
library(rcompanion)
library(ggplot2)

bin_res_logreg <- read.csv("../data_clean/logreg_q20_pred.csv")
summary_stats_logreg <- read.csv("../data_clean/logreg_q20_stats.csv")

bin_res_mlp <- read.csv("../data_clean/mlp_q20_pred-1.csv")
summary_stats_mlp <- read.csv("../data_clean/mlp_q20_stats-1.csv")

summary_stats_logreg$model <- "Logistic Regression"
summary_stats_mlp$model <- "Multilayer Perceptron"

logreg.m <- lm(test.acc ~ avg, data = mutate_if(summary_stats_logreg, is.numeric, scale))
summary(logreg.m)
confint(logreg.m)

mlp.m <- lm(test.acc ~ avg, data = mutate_if(summary_stats_mlp, is.numeric, scale))
summary(mlp.m)
confint(mlp.m)

all_stats <- rbind(summary_stats_logreg, summary_stats_mlp)

# Make contingency table
correct <- aggregate(bin_res$correct, by=list(bin=bin_res$bin), FUN=sum)
bin_res$incorrect <- ifelse(bin_res$correct == 1, 0, 1)
incorrect <- aggregate(bin_res$incorrect, by=list(bin=bin_res$bin), FUN=sum)

dt <- cbind(correct, incorrect$x)
colnames(dt) <- c("bin","correct","incorrect")
dt$total <- dt$correct + dt$incorrect
dt$bin <- as.factor(dt$bin)

dt <- data.frame(dt, row.names = 1)
dt$total <- NULL

# Test for main effect
chisq.test(dt)

# Multiple comparisons
pw <- pairwiseNominalIndependence(as.matrix(dt),
                                  fisher = FALSE,
                                  gtest  = FALSE,
                                  chisq  = TRUE,
                                  cramer = TRUE,
                                  method = "fdr")

pw$sig <- ifelse(pw$p.adj.Chisq <= 0.05, TRUE, FALSE)

median(pw$Cramer.V[pw$sig == 1])

# Logistic regression
m1 <- glm(bin_res$correct ~ bin_res$bin, family = binomial())
car::Anova(m1)

summary(m1)

# Linear regression
all_data <- all_data %>% mutate_if(is.numeric, scale)

logreg_10.m <- lm(test.acc ~ avg, data = all_data[all_data$model == "Logistic Regression" & all_data$num_bins == "10"])
summary(logreg_10.m)

# Plot log reg
ggplot(data = summary_stats_logreg, aes(x = avg, y = test.acc)) +
       geom_point() +
       geom_smooth(method='glm', formula = y~x) +
       coord_cartesian(ylim = c(0.50,0.92)) +
       xlab("Trophy average in bin") +
       ylab("Test accuracy")

# Plot mlp
ggplot(data = summary_stats_mlp, aes(x = avg, y = test.acc)) +
  geom_point() +
  geom_smooth(method='glm', formula = y~x) +
  coord_cartesian(ylim = c(0.50,0.90)) +
  xlab("Trophy average in bin") +
  ylab("Test accuracy")

# Plot log reg and mlp together
ggplot(data = all_stats, aes(x = avg, y = test.acc, color = model)) +
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
  labs(color = "")

ggsave("../plots/test_acc_linreg.png", device = "png", dpi = 300)

# Loess-esque Alternative plot
ggplot(data = bin_res, aes(x=match.trophy, y=correct)) +
  geom_point(size=2, alpha=0.4) +
  stat_smooth(colour="blue", size=1.5) +
  xlab("Trophies") +
  ylab("Probability of correct prediction") +
  theme_bw()

# Write data
write.csv(pw, file = "../data_clean/chisq_lm_tests.csv")


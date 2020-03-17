library(dplyr)
library(rcompanion)
library(ggplot2)

bin_res <- read.csv("../data_clean/logreg_q20_pred.csv")
summary_stats <- read.csv("../data_clean/logreg_q20_stats.csv")

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
bin_res.sc <- bin_res %>% mutate_if(is.numeric, scale)
m2 <- lm(bin_res.sc$correct ~ bin_res.sc$bin)
summary(m2)

# Plot
ggplot(data = summary_stats, aes(x = avg, y = test.acc)) +
       geom_point() +
       geom_smooth(method='glm', formula = y~x) +
       coord_cartesian(ylim = c(0.50,0.65)) +
       xlab("Trophy average in bin") +
       ylab("Test accuracy")


# Write data
write.csv(pw, file = "../data_clean/chisq_lm_tests.csv")


library(plyr)
library(dplyr)
library(car)

bin_res <- read.csv("../data_clean/logreg_q20_pred.csv")
summary_stats <- read.csv("../data_clean/logreg_q20_stats.csv")

# Make contingency table
correct <- aggregate(bin_res$correct, by=list(bin=bin_res$bin), FUN=sum)
incorrect <- aggregate(bin_res$incorrect, by=list(bin=bin_res$bin), FUN=sum)

table <- cbind(correct,incorrect$x)
colnames(table) <- c("bin","correct","incorrect")
table$total <- table$correct + table$incorrect

table$bin <- as.factor(table$bin)

table <- data.frame(table, row.names = 1)
table$total <- NULL

# First test
chisq.test(bin_res$correct, bin_res$bin)

# Multiple comparisons
pairwiseNominalIndependence(as.matrix(table),
                            fisher = FALSE,
                            gtest  = FALSE,
                            chisq  = TRUE,
                            method = "fdr")




tab <- data.frame(table(bin_res$correct, bin_res$bin))

# 2 here has it calculate proportions within each group as opposed to compared to the total
(prop_tab <- prop.table(tab, 2))

chisq.test(tab)

data.table(count(bin_res, vars=c("bin","correct")))

model <- glm(cbind(correct, incorrect) ~ bin, data=tab, family=binomial(logit))

anova(model)
lsmeans(model, pairwise ~ bin)

bin_res$incorrect <- ifelse(bin_res$correct == 1, 0, 1)


chisq.test(table)
chisq.posthoc.test(table)


dt <- bin_res %>%
  group_by(bin) %>%
  count(correct)
# Desired output

#  correct | incorrect
# 1       |
#--------------------
# 2       |
# --------------------
# 3       |
# --------------------
# 4       |
# --------------------
# 5       |






chisq.test(bin_res$correct[bin_res$bin == 0], bin_res$correct[bin_res$bin == 1])

table(bin_res$correct/bin_res, bin_res$bin)

kruskal.test(correct ~ bin, data = bin_res)
pairwise.wilcox.test(bin_res$correct, bin_res$bin,
                     p.adjust.method = "none")

chisq.multcomp(bin_res$correct, bin_res$bin, p.method = "holm")



counts <- c(49,30,63,59)
chisq.test(counts)
chisq.multcomp(counts)

chisq.posthoc.test(bin_res$correct, bin_res$bin)

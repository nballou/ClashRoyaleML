# Sum every 4th column (starting at 17 for presence/absence of L cards, 18 for presence/absence of R cards,
# 19 for avg level of L cards, 20 for avg level of R cards)
data$num_cards_L <- rowSums(data[,seq(17,319,by = 4)])
data$num_cards_R <- rowSums(data[,seq(18,319,by = 4)])
data$avg_lvl_L <- rowSums(data[,seq(19,320,by = 4)], na.rm = TRUE)/8
data$avg_lvl_R <- rowSums(data[,seq(20,320, by = 4)], na.rm = TRUE)/8

data$level_discrepancy <- data$avg_lvl_L-data$avg_lvl_R

summary(data$avg_lvl_L)
test <- data[data$num_cards_R > 8,]

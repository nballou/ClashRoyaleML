# Sum every 4th column (starting at 17 for presence/absence of L cards, 18 for presence/absence of R cards,
# 19 for avg level of L cards, 20 for avg level of R cards)
data$num_cards_L <- rowSums(data[,seq(17,319,by = 4)])
data$num_cards_R <- rowSums(data[,seq(18,319,by = 4)])
data$avg_lvl_L <- rowSums(data[,seq(19,320,by = 4)], na.rm = TRUE)/8
data$avg_lvl_R <- rowSums(data[,seq(20,320, by = 4)], na.rm = TRUE)/8

data$level_discrepancy <- data$avg_lvl_L-data$avg_lvl_R

data$left_elixir_cost <- 0
data$right_elixir_cost <- 0

# Function which goes through each card in the dataset, an increments the total elixir cost of each deck if it finds that card present
# for each player.
calc_avg_elixir <- function(df) {
  for (i in 1:74) {
    card_name_L <- paste("^", all_cards[i], "_L", "$", sep = "")
    card_name_R <- paste("^", all_cards[i], "_R", "$", sep = "")

    col_index_L <- grep(card_name_L, colnames(df))[1]
    col_index_R <- grep(card_name_R, colnames(df))[1]

    print(c(card_name_L,col_index_L))

    df$left_elixir_cost <- ifelse(df[,col_index_L] == 1, df$left_elixir_cost+costs[i],df$left_elixir_cost)
    df$right_elixir_cost <- ifelse(df[,col_index_R] == 1, df$right_elixir_cost+costs[i],df$right_elixir_cost)

    print(df$left_elixir_cost[2])
  }
  return(df)
}

data <- calc_avg_elixir(data)

# Number of unique decks
# This is based on location of the first relevant column, so be careful checking to see if you're using processed or raw data
nrow(unique(data[,seq(19,321,by = 4)])) # 16617 unique left decks



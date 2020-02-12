library(ggplot2)

data <- read.csv("processed_data.csv")

# Function to calculate the win and use rates of a card; takes a string with the card name (with underscores) as an argument.
calc_winrate <- function(card_name) {

  card_name_L <- paste("^", card_name, "_L", "$", sep = "")
  card_name_R <- paste("^", card_name, "_R", "$", sep = "")

  col_index_L <- grep(card_name_L, colnames(data))[1]
  col_index_R <- grep(card_name_R, colnames(data))[1]

  num_wins_L <- nrow(subset(data, data$winner == "left" & data[,col_index_L] == 1))
  num_matches_L <- nrow(subset(data, data[,col_index_L] == 1))

  num_wins_R <- nrow(subset(data, data$winner == "right" & data[,col_index_R] == 1))
  num_matches_R <- nrow(subset(data, data[,col_index_R] == 1))

  winrate <- (num_wins_L+num_wins_R)/(num_matches_L + num_matches_R)
  use_rate <- (num_matches_L+num_matches_R)/(nrow(data)*2)

  return(c(winrate,use_rate))
}

# Function to calculate the win and use rates of two cards when used together.
calc_winrate_double <- function(card_name1, card_name2) {

  card1_name_L <- paste("^", card_name1, "_L", "$", sep = "")
  card1_name_R <- paste("^", card_name1, "_R", "$", sep = "")

  card2_name_L <- paste("^", card_name2, "_L", "$", sep = "")
  card2_name_R <- paste("^", card_name2, "_R", "$", sep = "")

  col_index1_L <- grep(card1_name_L, colnames(data))[1]
  col_index1_R <- grep(card1_name_R, colnames(data))[1]

  col_index2_L <- grep(card2_name_L, colnames(data))[1]
  col_index2_R <- grep(card2_name_R, colnames(data))[1]

  num_wins_L <- nrow(subset(data, data$winner == "left" & data[,col_index1_L] == 1 & data[,col_index2_L] == 1))
  num_matches_L <- nrow(subset(data, data[,col_index1_L] == 1 & data[col_index2_L] == 1))

  num_wins_R <- nrow(subset(data, data$winner == "right" & data[,col_index1_R] == 1 & data[,col_index2_R] == 1))
  num_matches_R <- nrow(subset(data, data[,col_index1_R] == 1 & data[col_index2_R] == 1))

  winrate <- (num_wins_L+num_wins_R)/(num_matches_L + num_matches_R)
  use_rate <- (num_matches_L+num_matches_R)/(nrow(data)*2)

  return(c(winrate,use_rate))
}

# Function to calculate the win rate of a card against a specific counter; i.e., the percentage of matches won with that card given
# that the opponent has a particular counter card.
calc_winrate_counter <- function(my_card, opp_card) {

  card1_name_L <- paste("^", my_card, "_L", "$", sep = "")
  card1_name_R <- paste("^", my_card, "_R", "$", sep = "")

  card2_name_L <- paste("^", opp_card, "_L", "$", sep = "")
  card2_name_R <- paste("^", opp_card, "_R", "$", sep = "")

  col_index1_L <- grep(card1_name_L, colnames(data))[1]
  col_index1_R <- grep(card1_name_R, colnames(data))[1]

  col_index2_L <- grep(card2_name_L, colnames(data))[1]
  col_index2_R <- grep(card2_name_R, colnames(data))[1]

  num_wins_L <- nrow(subset(data, data$winner == "left" & data[,col_index1_L] == 1 & data[,col_index2_R] == 1))
  num_matches_L <- nrow(subset(data, data[,col_index1_L] == 1 & data[col_index2_R] == 1))

  num_wins_R <- nrow(subset(data, data$winner == "right" & data[,col_index1_R] == 1 & data[,col_index2_L] == 1))
  num_matches_R <- nrow(subset(data, data[,col_index1_R] == 1 & data[col_index2_L] == 1))

  winrate <- (num_wins_L+num_wins_R)/(num_matches_L + num_matches_R)
  use_rate <- (num_matches_L+num_matches_R)/(nrow(data)*2)

  return(c(winrate,use_rate))
}

# Function to calculate the card that has the best winrate against a specific enemy card (argument is the enemy card you want to counter)
best_counter <- function(opponent_card) {

  curr_best = c("",0)

  for (card in all_cards) {
    x <- c(card, calc_winrate_counter(card, opponent_card)[1])
    if (x[2] > curr_best[2]) {
      curr_best <- x
    }
    print(x)
  }
  return(curr_best)
}

best_combo <- function() {
  x <- setNames(data.frame(matrix(ncol = 3, nrow = 0)), c("Card1", "Card2","Winrate"))
  for (card1 in all_cards) {
    for (card2 in all_cards) {
      wr <- calc_winrate_double(card1,card2)[1]
      x[nrow(x) + 1,] = c(card1,card2,wr)
      print(c(card1,card2,wr))
    }
  }
  return(x)
}

y <- best_combo()

# Complete list of all cards in the sample as a vector
all_cards <- c("Skeletons","Ice_Spirit","Goblins","Spear_Goblins","Zap","Bats","Fire_Spirits","Archers","Arrows","Knight","Minions",
              "Bomber","Cannon","Goblin_Gang","Mortar","Tesla","Barbarians","Minion_Horde","Royal_Giant","Elite_Barbarians","Heal",
              "Ice_Golem","Tombstone","Mega_Minion","Dart_Goblin","Fireball","Mini_Pekka","Musketeer","Hog_Rider","Valkyrie","Battle_Ram",
              "Furnace","Bomb_Tower","Giant","Goblin_Hut","Inferno_Tower","Wizard","Rocket","Elixir_Collector","Barbarian_Hut",
              "Three_Musketeers","Mirror","Rage","Skeleton_Army","Goblin_Barrel","Tornado","Guards","Clone","Baby_Dragon","Poison",
              "Dark_Prince","Freeze","Prince","Witch","Balloon","Bowler","Executioner","Giant_Skeleton","Lightning","X_Bow","PEKKA","Golem",
              "The_Log","Miner","Princess","Ice_Wizard","Bandit","Night_Witch","Inferno_Dragon","Lumberjack","Electro_Wizard","Graveyard",
              "Sparky","Lava_Hound")

costs <- c(1,1,2,2,2,2,2,3,3,3,3,3,3,3,4,4,5,5,6,6,2,2,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,6,6,7,9,3,1,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,8,2,3,3,3,3,4,4,4,4,5,6,7)

# Initialize empty data frame
winrates <- setNames(data.frame(matrix(ncol = 3, nrow = 0)), c("Card", "Winrate","Use_rate"))

# Calculate winrate and userate for each card in the sample, save to the winrates data frame above
for (curr_card in all_cards) {
  temp <- c(curr_card,calc_winrate(curr_card))
  print(temp)
  winrates[nrow(winrates) + 1,] = c(curr_card,temp[2],temp[3])
}

# Win and use rates are imputed as strings, so convert to floats
winrates$Winrate <- as.numeric(winrates$Winrate)
winrates$Use_rate <- as.numeric(winrates$Use_rate)

# Calc winrate for particular card
calc_winrate("Lava_Hound")

# Calc winrate for particular pair of cards
calc_winrate_double("Bandit","Inferno_Dragon")

# Calculate best card to counter 1 enemy card
best_counter("Battle_Ram")


left_upsets <- nrow(data[data$winner == "left" & data$players.left.trophy <= data$players.right.trophy,])
right_upsets <- nrow(data[data$winner == "right" & data$players.left.trophy >= data$players.right.trophy,])

left_big_upsets <- nrow(data[data$winner == "left" & data$players.left.trophy <= data$players.right.trophy-50,])
right_big_upsets <- nrow(data[data$winner == "right" & data$players.left.trophy >= data$players.right.trophy+50,])


left_upsets + right_upsets
left_big_upsets + right_big_upsets

nrow(data[data$winner == "left",])

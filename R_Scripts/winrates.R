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

# Complete list of all cards in the sample as a vector
all_cards <- c("Skeletons","Ice_Spirit","Goblins","Spear_Goblins","Zap","Bats","Fire_Spirits","Archers","Arrows","Knight","Minions",
              "Bomber","Cannon","Goblin_Gang","Mortar","Tesla","Barbarians","Minion_Horde","Royal_Giant","Elite_Barbarians","Heal",
              "Ice_Golem","Tombstone","Mega_Minion","Dart_Goblin","Fireball","Mini_Pekka","Musketeer","Hog_Rider","Valkyrie","Battle_Ram",
              "Furnace","Bomb_Tower","Giant","Goblin_Hut","Inferno_Tower","Wizard","Rocket","Elixir_Collector","Barbarian_Hut",
              "Three_Musketeers","Mirror","Rage","Skeleton_Army","Goblin_Barrel","Tornado","Guards","Clone","Baby_Dragon","Poison",
              "Dark_Prince","Freeze","Prince","Witch","Balloon","Bowler","Executioner","Giant_Skeleton","Lightning","X_Bow","PEKKA","Golem",
              "The_Log","Miner","Princess","Ice_Wizard","Bandit","Night_Witch","Inferno_Dragon","Lumberjack","Electro_Wizard","Graveyard",
              "Sparky","Lava_Hound")

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

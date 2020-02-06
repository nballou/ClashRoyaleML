# Number of Ties
# nrow(data[data$left.result == data$right.result,])

# str <- "[['Royal Giant', '13'], ['Ice Wizard', '2'], ['Bomber', '12']]"
# test <- str_match(str, "(?<=Bomber.{4})\\d+")[,1]

# ----------------------------------------
# Common Cards
# ----------------------------------------

# Skeletons
data$Skeletons_L <- ifelse(grepl("Skeletons",data$players.left.deck, fixed = TRUE), 1, 0)
data$Skeletons_R <- ifelse(grepl("Skeletons",data$players.right.deck, fixed = TRUE), 1, 0)
data$Skeletons_L_lvl <- ifelse(data$Skeletons_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Skeletons.{4})\\d+")[,1]), NA)
data$Skeletons_R_lvl <- ifelse(data$Skeletons_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Skeletons.{4})\\d+")[,1]), NA)

# Ice Spirit
data$Ice_Spirit_L <- ifelse(grepl("Ice Spirit",data$players.left.deck, fixed = TRUE), 1, 0)
data$Ice_Spirit_R <- ifelse(grepl("Ice Spirit",data$players.right.deck, fixed = TRUE), 1, 0)
data$Ice_Spirit_L_lvl <- ifelse(data$Ice_Spirit_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Ice Spirit.{4})\\d+")[,1]), NA)
data$Ice_Spirit_R_lvl <- ifelse(data$Ice_Spirit_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Ice Spirit.{4})\\d+")[,1]), NA)

# Goblins
data$Goblins_L <- ifelse(grepl("'Goblins",data$players.left.deck, fixed = TRUE), 1, 0)
data$Goblins_R <- ifelse(grepl("'Goblins",data$players.right.deck, fixed = TRUE), 1, 0)
data$Goblins_L_lvl <- ifelse(data$Goblins_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Goblins.{4})\\d+")[,1]), NA)
data$Goblins_R_lvl <- ifelse(data$Goblins_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Goblins.{4})\\d+")[,1]), NA)

# Spear Goblins
data$Spear_Goblins_L <- ifelse(grepl("Spear Goblins",data$players.left.deck, fixed = TRUE), 1, 0)
data$Spear_Goblins_R <- ifelse(grepl("Spear Goblins",data$players.right.deck, fixed = TRUE), 1, 0)
data$Spear_Goblins_L_lvl <- ifelse(data$Spear_Goblins_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Spear Goblins.{4})\\d+")[,1]), NA)
data$Spear_Goblins_R_lvl <- ifelse(data$Spear_Goblins_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Spear Goblins.{4})\\d+")[,1]), NA)

# Zap
data$Zap_L <- ifelse(grepl("Zap",data$players.left.deck, fixed = TRUE), 1, 0)
data$Zap_R <- ifelse(grepl("Zap",data$players.right.deck, fixed = TRUE), 1, 0)
data$Zap_L_lvl <- ifelse(data$Zap_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Zap.{4})\\d+")[,1]), NA)
data$Zap_R_lvl <- ifelse(data$Zap_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Zap.{4})\\d+")[,1]), NA)

# Bats
data$Bats_L <- ifelse(grepl("Bats",data$players.left.deck, fixed = TRUE), 1, 0)
data$Bats_R <- ifelse(grepl("Bats",data$players.right.deck, fixed = TRUE), 1, 0)
data$Bats_L_lvl <- ifelse(data$Bats_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Bats.{4})\\d+")[,1]), NA)
data$Bats_R_lvl <- ifelse(data$Bats_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Bats.{4})\\d+")[,1]), NA)

# Fire Spirits
data$Fire_Spirits_L <- ifelse(grepl("Fire Spirits",data$players.left.deck, fixed = TRUE), 1, 0)
data$Fire_Spirits_R <- ifelse(grepl("Fire Spirits",data$players.right.deck, fixed = TRUE), 1, 0)
data$Fire_Spirits_L_lvl <- ifelse(data$Fire_Spirits_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Fire Spirits.{4})\\d+")[,1]), NA)
data$Fire_Spirits_R_lvl <- ifelse(data$Fire_Spirits_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Fire Spirits.{4})\\d+")[,1]), NA)

# Archers
data$Archers_L <- ifelse(grepl("Archers",data$players.left.deck, fixed = TRUE), 1, 0)
data$Archers_R <- ifelse(grepl("Archers",data$players.right.deck, fixed = TRUE), 1, 0)
data$Archers_L_lvl <- ifelse(data$Archers_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Archers.{4})\\d+")[,1]), NA)
data$Archers_R_lvl <- ifelse(data$Archers_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Archers.{4})\\d+")[,1]), NA)

# Arrows
data$Arrows_L <- ifelse(grepl("Arrows",data$players.left.deck, fixed = TRUE), 1, 0)
data$Arrows_R <- ifelse(grepl("Arrows",data$players.right.deck, fixed = TRUE), 1, 0)
data$Arrows_L_lvl <- ifelse(data$Arrows_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Arrows.{4})\\d+")[,1]), NA)
data$Arrows_R_lvl <- ifelse(data$Arrows_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Arrows.{4})\\d+")[,1]), NA)

# Knight
data$Knight_L <- ifelse(grepl("Knight",data$players.left.deck, fixed = TRUE), 1, 0)
data$Knight_R <- ifelse(grepl("Knight",data$players.right.deck, fixed = TRUE), 1, 0)
data$Knight_L_lvl <- ifelse(data$Knight_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Knight.{4})\\d+")[,1]), NA)
data$Knight_R_lvl <- ifelse(data$Knight_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Knight.{4})\\d+")[,1]), NA)

# Minions
data$Minions_L <- ifelse(grepl("Minions",data$players.left.deck, fixed = TRUE), 1, 0)
data$Minions_R <- ifelse(grepl("Minions",data$players.right.deck, fixed = TRUE), 1, 0)
data$Minions_L_lvl <- ifelse(data$Minions_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Minions.{4})\\d+")[,1]), NA)
data$Minions_R_lvl <- ifelse(data$Minions_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Minions.{4})\\d+")[,1]), NA)

# Bomber
data$Bomber_L <- ifelse(grepl("Bomber",data$players.left.deck, fixed = TRUE), 1, 0)
data$Bomber_R <- ifelse(grepl("Bomber",data$players.right.deck, fixed = TRUE), 1, 0)
data$Bomber_L_lvl <- ifelse(data$Bomber_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Bomber.{4})\\d+")[,1]), NA)
data$Bomber_R_lvl <- ifelse(data$Bomber_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Bomber.{4})\\d+")[,1]), NA)

# Cannon
data$Cannon_L <- ifelse(grepl("Cannon",data$players.left.deck, fixed = TRUE), 1, 0)
data$Cannon_R <- ifelse(grepl("Cannon",data$players.right.deck, fixed = TRUE), 1, 0)
data$Cannon_L_lvl <- ifelse(data$Cannon_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Cannon.{4})\\d+")[,1]), NA)
data$Cannon_R_lvl <- ifelse(data$Cannon_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Cannon.{4})\\d+")[,1]), NA)

# Goblin Gang
data$Goblin_Gang_L <- ifelse(grepl("Goblin Gang",data$players.left.deck, fixed = TRUE), 1, 0)
data$Goblin_Gang_R <- ifelse(grepl("Goblin Gang",data$players.right.deck, fixed = TRUE), 1, 0)
data$Goblin_Gang_L_lvl <- ifelse(data$Goblin_Gang_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Goblin Gang.{4})\\d+")[,1]), NA)
data$Goblin_Gang_R_lvl <- ifelse(data$Goblin_Gang_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Goblin Gang.{4})\\d+")[,1]), NA)

# Mortar
data$Mortar_L <- ifelse(grepl("Mortar",data$players.left.deck, fixed = TRUE), 1, 0)
data$Mortar_R <- ifelse(grepl("Mortar",data$players.right.deck, fixed = TRUE), 1, 0)
data$Mortar_L_lvl <- ifelse(data$Mortar_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Mortar.{4})\\d+")[,1]), NA)
data$Mortar_R_lvl <- ifelse(data$Mortar_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Mortar.{4})\\d+")[,1]), NA)

# Tesla
data$Tesla_L <- ifelse(grepl("Tesla",data$players.left.deck, fixed = TRUE), 1, 0)
data$Tesla_R <- ifelse(grepl("Tesla",data$players.right.deck, fixed = TRUE), 1, 0)
data$Tesla_L_lvl <- ifelse(data$Tesla_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Tesla.{4})\\d+")[,1]), NA)
data$Tesla_R_lvl <- ifelse(data$Tesla_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Tesla.{4})\\d+")[,1]), NA)

# Barbarians
data$Barbarians_L <- ifelse(grepl("'Barbarians",data$players.left.deck, fixed = TRUE), 1, 0)
data$Barbarians_R <- ifelse(grepl("'Barbarians",data$players.right.deck, fixed = TRUE), 1, 0)
data$Barbarians_L_lvl <- ifelse(data$Barbarians_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Barbarians.{4})\\d+")[,1]), NA)
data$Barbarians_R_lvl <- ifelse(data$Barbarians_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Barbarians.{4})\\d+")[,1]), NA)

# Minion Horde
data$Minion_Horde_L <- ifelse(grepl("Minion Horde",data$players.left.deck, fixed = TRUE), 1, 0)
data$Minion_Horde_R <- ifelse(grepl("Minion Horde",data$players.right.deck, fixed = TRUE), 1, 0)
data$Minion_Horde_L_lvl <- ifelse(data$Minion_Horde_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Minion Horde.{4})\\d+")[,1]), NA)
data$Minion_Horde_R_lvl <- ifelse(data$Minion_Horde_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Minion Horde.{4})\\d+")[,1]), NA)

# Royal Giant
data$Royal_Giant_L <- ifelse(grepl("Royal Giant",data$players.left.deck, fixed = TRUE), 1, 0)
data$Royal_Giant_R <- ifelse(grepl("Royal Giant",data$players.right.deck, fixed = TRUE), 1, 0)
data$Royal_Giant_L_lvl <- ifelse(data$Royal_Giant_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Royal Giant.{4})\\d+")[,1]), NA)
data$Royal_Giant_R_lvl <- ifelse(data$Royal_Giant_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Royal Giant.{4})\\d+")[,1]), NA)

# Elite Barbarians
data$Elite_Barbarians_L <- ifelse(grepl("Elite Barbarians",data$players.left.deck, fixed = TRUE), 1, 0)
data$Elite_Barbarians_R <- ifelse(grepl("Elite Barbarians",data$players.right.deck, fixed = TRUE), 1, 0)
data$Elite_Barbarians_L_lvl <- ifelse(data$Elite_Barbarians_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Elite Barbarians.{4})\\d+")[,1]), NA)
data$Elite_Barbarians_R_lvl <- ifelse(data$Elite_Barbarians_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Elite Barbarians.{4})\\d+")[,1]), NA)



# ----------------------------------------
# Rare Cards
# ----------------------------------------
# Heal
data$Heal_L <- ifelse(grepl("Heal",data$players.left.deck, fixed = TRUE), 1, 0)
data$Heal_R <- ifelse(grepl("Heal",data$players.right.deck, fixed = TRUE), 1, 0)
data$Heal_L_lvl <- ifelse(data$Heal_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Heal.{4})\\d+")[,1])+2, NA)
data$Heal_R_lvl <- ifelse(data$Heal_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Heal.{4})\\d+")[,1])+2, NA)

# Ice Golem
data$Ice_Golem_L <- ifelse(grepl("Ice Golem",data$players.left.deck, fixed = TRUE), 1, 0)
data$Ice_Golem_R <- ifelse(grepl("Ice Golem",data$players.right.deck, fixed = TRUE), 1, 0)
data$Ice_Golem_L_lvl <- ifelse(data$Ice_Golem_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Ice Golem.{4})\\d+")[,1])+2, NA)
data$Ice_Golem_R_lvl <- ifelse(data$Ice_Golem_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Ice Golem.{4})\\d+")[,1])+2, NA)

# Tombstone
data$Tombstone_L <- ifelse(grepl("Tombstone",data$players.left.deck, fixed = TRUE), 1, 0)
data$Tombstone_R <- ifelse(grepl("Tombstone",data$players.right.deck, fixed = TRUE), 1, 0)
data$Tombstone_L_lvl <- ifelse(data$Tombstone_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Tombstone.{4})\\d+")[,1])+2, NA)
data$Tombstone_R_lvl <- ifelse(data$Tombstone_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Tombstone.{4})\\d+")[,1])+2, NA)

# Mega Minion
data$Mega_Minion_L <- ifelse(grepl("Mega Minion",data$players.left.deck, fixed = TRUE), 1, 0)
data$Mega_Minion_R <- ifelse(grepl("Mega Minion",data$players.right.deck, fixed = TRUE), 1, 0)
data$Mega_Minion_L_lvl <- ifelse(data$Mega_Minion_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Mega Minion.{4})\\d+")[,1])+2, NA)
data$Mega_Minion_R_lvl <- ifelse(data$Mega_Minion_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Mega Minion.{4})\\d+")[,1])+2, NA)

# Dart Goblin
data$Dart_Goblin_L <- ifelse(grepl("Dart Goblin",data$players.left.deck, fixed = TRUE), 1, 0)
data$Dart_Goblin_R <- ifelse(grepl("Dart Goblin",data$players.right.deck, fixed = TRUE), 1, 0)
data$Dart_Goblin_L_lvl <- ifelse(data$Dart_Goblin_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Dart Goblin.{4})\\d+")[,1])+2, NA)
data$Dart_Goblin_R_lvl <- ifelse(data$Dart_Goblin_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Dart Goblin.{4})\\d+")[,1])+2, NA)

# Fireball
data$Fireball_L <- ifelse(grepl("Fireball",data$players.left.deck, fixed = TRUE), 1, 0)
data$Fireball_R <- ifelse(grepl("Fireball",data$players.right.deck, fixed = TRUE), 1, 0)
data$Fireball_L_lvl <- ifelse(data$Fireball_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Fireball.{4})\\d+")[,1])+2, NA)
data$Fireball_R_lvl <- ifelse(data$Fireball_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Fireball.{4})\\d+")[,1])+2, NA)

# Mini P.E.K.K.A
data$Mini_Pekka_L <- ifelse(grepl("Mini P.E.K.K.A",data$players.left.deck, fixed = TRUE), 1, 0)
data$Mini_Pekka_R <- ifelse(grepl("Mini P.E.K.K.A",data$players.right.deck, fixed = TRUE), 1, 0)
data$Mini_Pekka_L_lvl <- ifelse(data$Mini_Pekka_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Mini P\\.E\\.K\\.K\\.A.{4})\\d+")[,1])+2, NA)
data$Mini_Pekka_R_lvl <- ifelse(data$Mini_Pekka_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Mini P\\.E\\.K\\.K\\.A.{4})\\d+")[,1])+2, NA)

# Musketeer
data$Musketeer_L <- ifelse(grepl("'Musketeer",data$players.left.deck, fixed = TRUE), 1, 0)
data$Musketeer_R <- ifelse(grepl("'Musketeer",data$players.right.deck, fixed = TRUE), 1, 0)
data$Musketeer_L_lvl <- ifelse(data$Musketeer_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Musketeer.{4})\\d+")[,1])+2, NA)
data$Musketeer_R_lvl <- ifelse(data$Musketeer_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Musketeer.{4})\\d+")[,1])+2, NA)

# Hog Rider
data$Hog_Rider_L <- ifelse(grepl("Hog Rider",data$players.left.deck, fixed = TRUE), 1, 0)
data$Hog_Rider_R <- ifelse(grepl("Hog Rider",data$players.right.deck, fixed = TRUE), 1, 0)
data$Hog_Rider_L_lvl <- ifelse(data$Hog_Rider_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Hog Rider.{4})\\d+")[,1])+2, NA)
data$Hog_Rider_R_lvl <- ifelse(data$Hog_Rider_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Hog Rider.{4})\\d+")[,1])+2, NA)

# Valkyrie
data$Valkyrie_L <- ifelse(grepl("Valkyrie",data$players.left.deck, fixed = TRUE), 1, 0)
data$Valkyrie_R <- ifelse(grepl("Valkyrie",data$players.right.deck, fixed = TRUE), 1, 0)
data$Valkyrie_L_lvl <- ifelse(data$Valkyrie_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Valkyrie.{4})\\d+")[,1])+2, NA)
data$Valkyrie_R_lvl <- ifelse(data$Valkyrie_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Valkyrie.{4})\\d+")[,1])+2, NA)

# Battle Ram
data$Battle_Ram_L <- ifelse(grepl("Battle Ram",data$players.left.deck, fixed = TRUE), 1, 0)
data$Battle_Ram_R <- ifelse(grepl("Battle Ram",data$players.right.deck, fixed = TRUE), 1, 0)
data$Battle_Ram_L_lvl <- ifelse(data$Battle_Ram_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Battle Ram.{4})\\d+")[,1])+2, NA)
data$Battle_Ram_R_lvl <- ifelse(data$Battle_Ram_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Battle Ram.{4})\\d+")[,1])+2, NA)

# Furnace
data$Furnace_L <- ifelse(grepl("Furnace",data$players.left.deck, fixed = TRUE), 1, 0)
data$Furnace_R <- ifelse(grepl("Furnace",data$players.right.deck, fixed = TRUE), 1, 0)
data$Furnace_L_lvl <- ifelse(data$Furnace_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Furnace.{4})\\d+")[,1])+2, NA)
data$Furnace_R_lvl <- ifelse(data$Furnace_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Furnace.{4})\\d+")[,1])+2, NA)

# Flying Machine
data$Flying_Machine_L <- ifelse(grepl("Flying Machine",data$players.left.deck, fixed = TRUE), 1, 0)
data$Flying_Machine_R <- ifelse(grepl("Flying Machine",data$players.right.deck, fixed = TRUE), 1, 0)
data$Flying_Machine_L_lvl <- ifelse(data$Flying_Machine_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Flying Machine.{4})\\d+")[,1])+2, NA)
data$Flying_Machine_R_lvl <- ifelse(data$Flying_Machine_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Flying Machine.{4})\\d+")[,1])+2, NA)

# Bomb Tower
data$Bomb_Tower_L <- ifelse(grepl("Bomb Tower",data$players.left.deck, fixed = TRUE), 1, 0)
data$Bomb_Tower_R <- ifelse(grepl("Bomb Tower",data$players.right.deck, fixed = TRUE), 1, 0)
data$Bomb_Tower_L_lvl <- ifelse(data$Bomb_Tower_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Bomb Tower.{4})\\d+")[,1])+2, NA)
data$Bomb_Tower_R_lvl <- ifelse(data$Bomb_Tower_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Bomb Tower.{4})\\d+")[,1])+2, NA)

# Giant
data$Giant_L <- ifelse(grepl("'Giant'",data$players.left.deck, fixed = TRUE), 1, 0)
data$Giant_R <- ifelse(grepl("'Giant'",data$players.right.deck, fixed = TRUE), 1, 0)
data$Giant_L_lvl <- ifelse(data$Giant_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Giant'.{3})\\d+")[,1])+2, NA)
data$Giant_R_lvl <- ifelse(data$Giant_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Giant'.{3})\\d+")[,1])+2, NA)

# Goblin Hut
data$Goblin_Hut_L <- ifelse(grepl("Goblin Hut",data$players.left.deck, fixed = TRUE), 1, 0)
data$Goblin_Hut_R <- ifelse(grepl("Goblin Hut",data$players.right.deck, fixed = TRUE), 1, 0)
data$Goblin_Hut_L_lvl <- ifelse(data$Goblin_Hut_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Goblin Hut.{4})\\d+")[,1])+2, NA)
data$Goblin_Hut_R_lvl <- ifelse(data$Goblin_Hut_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Goblin Hut.{4})\\d+")[,1])+2, NA)

# Inferno Tower
data$Inferno_Tower_L <- ifelse(grepl("Inferno Tower",data$players.left.deck, fixed = TRUE), 1, 0)
data$Inferno_Tower_R <- ifelse(grepl("Inferno Tower",data$players.right.deck, fixed = TRUE), 1, 0)
data$Inferno_Tower_L_lvl <- ifelse(data$Inferno_Tower_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Inferno Tower.{4})\\d+")[,1])+2, NA)
data$Inferno_Tower_R_lvl <- ifelse(data$Inferno_Tower_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Inferno Tower.{4})\\d+")[,1])+2, NA)

# Wizard
data$Wizard_L <- ifelse(grepl("'Wizard",data$players.left.deck, fixed = TRUE), 1, 0)
data$Wizard_R <- ifelse(grepl("'Wizard",data$players.right.deck, fixed = TRUE), 1, 0)
data$Wizard_L_lvl <- ifelse(data$Wizard_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Wizard.{4})\\d+")[,1])+2, NA)
data$Wizard_R_lvl <- ifelse(data$Wizard_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Wizard.{4})\\d+")[,1])+2, NA)

# Rocket
data$Rocket_L <- ifelse(grepl("Rocket",data$players.left.deck, fixed = TRUE), 1, 0)
data$Rocket_R <- ifelse(grepl("Rocket",data$players.right.deck, fixed = TRUE), 1, 0)
data$Rocket_L_lvl <- ifelse(data$Rocket_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Rocket.{4})\\d+")[,1])+2, NA)
data$Rocket_R_lvl <- ifelse(data$Rocket_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Rocket.{4})\\d+")[,1])+2, NA)

# Elixir Collector
data$Elixir_Collector_L <- ifelse(grepl("Elixir Collector",data$players.left.deck, fixed = TRUE), 1, 0)
data$Elixir_Collector_R <- ifelse(grepl("Elixir Collector",data$players.right.deck, fixed = TRUE), 1, 0)
data$Elixir_Collector_L_lvl <- ifelse(data$Elixir_Collector_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Elixir Collector.{4})\\d+")[,1])+2, NA)
data$Elixir_Collector_R_lvl <- ifelse(data$Elixir_Collector_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Elixir Collector.{4})\\d+")[,1])+2, NA)

# Barbarian Hut
data$Barbarian_Hut_L <- ifelse(grepl("Barbarian Hut",data$players.left.deck, fixed = TRUE), 1, 0)
data$Barbarian_Hut_R <- ifelse(grepl("Barbarian Hut",data$players.right.deck, fixed = TRUE), 1, 0)
data$Barbarian_Hut_L_lvl <- ifelse(data$Barbarian_Hut_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Barbarian Hut.{4})\\d+")[,1])+2, NA)
data$Barbarian_Hut_R_lvl <- ifelse(data$Barbarian_Hut_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Barbarian Hut.{4})\\d+")[,1])+2, NA)

# Three Musketeers
data$Three_Musketeers_L <- ifelse(grepl("Three Musketeers",data$players.left.deck, fixed = TRUE), 1, 0)
data$Three_Musketeers_R <- ifelse(grepl("Three Musketeers",data$players.right.deck, fixed = TRUE), 1, 0)
data$Three_Musketeers_L_lvl <- ifelse(data$Three_Musketeers_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Three Musketeers.{4})\\d+")[,1])+2, NA)
data$Three_Musketeers_R_lvl <- ifelse(data$Three_Musketeers_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Three Musketeers.{4})\\d+")[,1])+2, NA)


# ---------------------------------------------
# Epic Cards
# ---------------------------------------------

# Mirror
data$Mirror_L <- ifelse(grepl("Mirror",data$players.left.deck, fixed = TRUE), 1, 0)
data$Mirror_R <- ifelse(grepl("Mirror",data$players.right.deck, fixed = TRUE), 1, 0)
data$Mirror_L_lvl <- ifelse(data$Mirror_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Mirror.{4})\\d+")[,1])+5, NA)
data$Mirror_R_lvl <- ifelse(data$Mirror_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Mirror.{4})\\d+")[,1])+5, NA)

# Rage
data$Rage_L <- ifelse(grepl("Rage",data$players.left.deck, fixed = TRUE), 1, 0)
data$Rage_R <- ifelse(grepl("Rage",data$players.right.deck, fixed = TRUE), 1, 0)
data$Rage_L_lvl <- ifelse(data$Rage_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Rage.{4})\\d+")[,1])+5, NA)
data$Rage_R_lvl <- ifelse(data$Rage_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Rage.{4})\\d+")[,1])+5, NA)

# Skeleton Army
data$Skeleton_Army_L <- ifelse(grepl("Skeleton Army",data$players.left.deck, fixed = TRUE), 1, 0)
data$Skeleton_Army_R <- ifelse(grepl("Skeleton Army",data$players.right.deck, fixed = TRUE), 1, 0)
data$Skeleton_Army_L_lvl <- ifelse(data$Skeleton_Army_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Skeleton Army.{4})\\d+")[,1])+5, NA)
data$Skeleton_Army_R_lvl <- ifelse(data$Skeleton_Army_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Skeleton Army.{4})\\d+")[,1])+5, NA)

# Goblin Barrel
data$Goblin_Barrel_L <- ifelse(grepl("Goblin Barrel",data$players.left.deck, fixed = TRUE), 1, 0)
data$Goblin_Barrel_R <- ifelse(grepl("Goblin Barrel",data$players.right.deck, fixed = TRUE), 1, 0)
data$Goblin_Barrel_L_lvl <- ifelse(data$Goblin_Barrel_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Goblin Barrel.{4})\\d+")[,1])+5, NA)
data$Goblin_Barrel_R_lvl <- ifelse(data$Goblin_Barrel_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Goblin Barrel.{4})\\d+")[,1])+5, NA)

# Tornado
data$Tornado_L <- ifelse(grepl("Tornado",data$players.left.deck, fixed = TRUE), 1, 0)
data$Tornado_R <- ifelse(grepl("Tornado",data$players.right.deck, fixed = TRUE), 1, 0)
data$Tornado_L_lvl <- ifelse(data$Tornado_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Tornado.{4})\\d+")[,1])+5, NA)
data$Tornado_R_lvl <- ifelse(data$Tornado_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Tornado.{4})\\d+")[,1])+5, NA)

# Guards
data$Guards_L <- ifelse(grepl("Guards",data$players.left.deck, fixed = TRUE), 1, 0)
data$Guards_R <- ifelse(grepl("Guards",data$players.right.deck, fixed = TRUE), 1, 0)
data$Guards_L_lvl <- ifelse(data$Guards_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Guards.{4})\\d+")[,1])+5, NA)
data$Guards_R_lvl <- ifelse(data$Guards_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Guards.{4})\\d+")[,1])+5, NA)

# Clone
data$Clone_L <- ifelse(grepl("Clone",data$players.left.deck, fixed = TRUE), 1, 0)
data$Clone_R <- ifelse(grepl("Clone",data$players.right.deck, fixed = TRUE), 1, 0)
data$Clone_L_lvl <- ifelse(data$Clone_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Clone.{4})\\d+")[,1])+5, NA)
data$Clone_R_lvl <- ifelse(data$Clone_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Clone.{4})\\d+")[,1])+5, NA)

# Baby Dragon
data$Baby_Dragon_L <- ifelse(grepl("Baby Dragon",data$players.left.deck, fixed = TRUE), 1, 0)
data$Baby_Dragon_R <- ifelse(grepl("Baby Dragon",data$players.right.deck, fixed = TRUE), 1, 0)
data$Baby_Dragon_L_lvl <- ifelse(data$Baby_Dragon_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Baby Dragon.{4})\\d+")[,1])+5, NA)
data$Baby_Dragon_R_lvl <- ifelse(data$Baby_Dragon_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Baby Dragon.{4})\\d+")[,1])+5, NA)

# Hunter
data$Hunter_L <- ifelse(grepl("Hunter",data$players.left.deck, fixed = TRUE), 1, 0)
data$Hunter_R <- ifelse(grepl("Hunter",data$players.right.deck, fixed = TRUE), 1, 0)
data$Hunter_L_lvl <- ifelse(data$Hunter_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Hunter.{4})\\d+")[,1])+5, NA)
data$Hunter_R_lvl <- ifelse(data$Hunter_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Hunter.{4})\\d+")[,1])+5, NA)

# Poison
data$Poison_L <- ifelse(grepl("Poison",data$players.left.deck, fixed = TRUE), 1, 0)
data$Poison_R <- ifelse(grepl("Poison",data$players.right.deck, fixed = TRUE), 1, 0)
data$Poison_L_lvl <- ifelse(data$Poison_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Poison.{4})\\d+")[,1])+5, NA)
data$Poison_R_lvl <- ifelse(data$Poison_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Poison.{4})\\d+")[,1])+5, NA)

# Dark Prince
data$Dark_Prince_L <- ifelse(grepl("Dark Prince",data$players.left.deck, fixed = TRUE), 1, 0)
data$Dark_Prince_R <- ifelse(grepl("Dark Prince",data$players.right.deck, fixed = TRUE), 1, 0)
data$Dark_Prince_L_lvl <- ifelse(data$Dark_Prince_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Dark Prince.{4})\\d+")[,1])+5, NA)
data$Dark_Prince_R_lvl <- ifelse(data$Dark_Prince_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Dark Prince.{4})\\d+")[,1])+5, NA)

# Freeze
data$Freeze_L <- ifelse(grepl("Freeze",data$players.left.deck, fixed = TRUE), 1, 0)
data$Freeze_R <- ifelse(grepl("Freeze",data$players.right.deck, fixed = TRUE), 1, 0)
data$Freeze_L_lvl <- ifelse(data$Freeze_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Freeze.{4})\\d+")[,1])+5, NA)
data$Freeze_R_lvl <- ifelse(data$Freeze_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Freeze.{4})\\d+")[,1])+5, NA)

# Prince
data$Prince_L <- ifelse(grepl("'Prince'",data$players.left.deck, fixed = TRUE), 1, 0)
data$Prince_R <- ifelse(grepl("'Prince'",data$players.right.deck, fixed = TRUE), 1, 0)
data$Prince_L_lvl <- ifelse(data$Prince_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Prince'.{3})\\d+")[,1])+5, NA)
data$Prince_R_lvl <- ifelse(data$Prince_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Prince'.{3})\\d+")[,1])+5, NA)

# Witch
data$Witch_L <- ifelse(grepl("'Witch",data$players.left.deck, fixed = TRUE), 1, 0)
data$Witch_R <- ifelse(grepl("'Witch",data$players.right.deck, fixed = TRUE), 1, 0)
data$Witch_L_lvl <- ifelse(data$Witch_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Witch.{4})\\d+")[,1])+5, NA)
data$Witch_R_lvl <- ifelse(data$Witch_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Witch.{4})\\d+")[,1])+5, NA)

# Balloon
data$Balloon_L <- ifelse(grepl("Balloon",data$players.left.deck, fixed = TRUE), 1, 0)
data$Balloon_R <- ifelse(grepl("Balloon",data$players.right.deck, fixed = TRUE), 1, 0)
data$Balloon_L_lvl <- ifelse(data$Balloon_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Balloon.{4})\\d+")[,1])+5, NA)
data$Balloon_R_lvl <- ifelse(data$Balloon_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Balloon.{4})\\d+")[,1])+5, NA)

# Bowler
data$Bowler_L <- ifelse(grepl("Bowler",data$players.left.deck, fixed = TRUE), 1, 0)
data$Bowler_R <- ifelse(grepl("Bowler",data$players.right.deck, fixed = TRUE), 1, 0)
data$Bowler_L_lvl <- ifelse(data$Bowler_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Bowler.{4})\\d+")[,1])+5, NA)
data$Bowler_R_lvl <- ifelse(data$Bowler_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Bowler.{4})\\d+")[,1])+5, NA)

# Executioner
data$Executioner_L <- ifelse(grepl("Executioner",data$players.left.deck, fixed = TRUE), 1, 0)
data$Executioner_R <- ifelse(grepl("Executioner",data$players.right.deck, fixed = TRUE), 1, 0)
data$Executioner_L_lvl <- ifelse(data$Executioner_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Executioner.{4})\\d+")[,1])+5, NA)
data$Executioner_R_lvl <- ifelse(data$Executioner_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Executioner.{4})\\d+")[,1])+5, NA)

# Giant Skeleton
data$Giant_Skeleton_L <- ifelse(grepl("Giant Skeleton",data$players.left.deck, fixed = TRUE), 1, 0)
data$Giant_Skeleton_R <- ifelse(grepl("Giant Skeleton",data$players.right.deck, fixed = TRUE), 1, 0)
data$Giant_Skeleton_L_lvl <- ifelse(data$Giant_Skeleton_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Giant Skeleton.{4})\\d+")[,1])+5, NA)
data$Giant_Skeleton_R_lvl <- ifelse(data$Giant_Skeleton_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Giant Skeleton.{4})\\d+")[,1])+5, NA)

# Lightning
data$Lightning_L <- ifelse(grepl("Lightning",data$players.left.deck, fixed = TRUE), 1, 0)
data$Lightning_R <- ifelse(grepl("Lightning",data$players.right.deck, fixed = TRUE), 1, 0)
data$Lightning_L_lvl <- ifelse(data$Lightning_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Lightning.{4})\\d+")[,1])+5, NA)
data$Lightning_R_lvl <- ifelse(data$Lightning_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Lightning.{4})\\d+")[,1])+5, NA)

# X-Bow
data$X_Bow_L <- ifelse(grepl("X-Bow",data$players.left.deck, fixed = TRUE), 1, 0)
data$X_Bow_R <- ifelse(grepl("X-Bow",data$players.right.deck, fixed = TRUE), 1, 0)
data$X_Bow_L_lvl <- ifelse(data$X_Bow_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=X-Bow.{4})\\d+")[,1])+5, NA)
data$X_Bow_R_lvl <- ifelse(data$X_Bow_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=X-Bow.{4})\\d+")[,1])+5, NA)

# P.E.K.K.A
data$PEKKA_L <- ifelse(grepl("'P.E.K.K.A",data$players.left.deck, fixed = TRUE), 1, 0)
data$PEKKA_R <- ifelse(grepl("'P.E.K.K.A",data$players.right.deck, fixed = TRUE), 1, 0)
data$PEKKA_L_lvl <- ifelse(data$PEKKA_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='P\\.E\\.K\\.K\\.A.{4})\\d+")[,1])+5, NA)
data$PEKKA_R_lvl <- ifelse(data$PEKKA_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='P\\.E\\.K\\.K\\.A.{4})\\d+")[,1])+5, NA)

# Golem
data$Golem_L <- ifelse(grepl("'Golem",data$players.left.deck, fixed = TRUE), 1, 0)
data$Golem_R <- ifelse(grepl("'Golem",data$players.right.deck, fixed = TRUE), 1, 0)
data$Golem_L_lvl <- ifelse(data$Golem_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<='Golem.{4})\\d+")[,1])+5, NA)
data$Golem_R_lvl <- ifelse(data$Golem_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<='Golem.{4})\\d+")[,1])+5, NA)

# ----------------------------------
# Legendary Cards
# ----------------------------------

# The Log
data$The_Log_L <- ifelse(grepl("The Log",data$players.left.deck, fixed = TRUE), 1, 0)
data$The_Log_R <- ifelse(grepl("The Log",data$players.right.deck, fixed = TRUE), 1, 0)
data$The_Log_L_lvl <- ifelse(data$The_Log_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=The Log.{4})\\d+")[,1])+8, NA)
data$The_Log_R_lvl <- ifelse(data$The_Log_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=The Log.{4})\\d+")[,1])+8, NA)

# Miner
data$Miner_L <- ifelse(grepl("Miner",data$players.left.deck, fixed = TRUE), 1, 0)
data$Miner_R <- ifelse(grepl("Miner",data$players.right.deck, fixed = TRUE), 1, 0)
data$Miner_L_lvl <- ifelse(data$Miner_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Miner.{4})\\d+")[,1])+8, NA)
data$Miner_R_lvl <- ifelse(data$Miner_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Miner.{4})\\d+")[,1])+8, NA)

# Princess
data$Princess_L <- ifelse(grepl("Princess",data$players.left.deck, fixed = TRUE), 1, 0)
data$Princess_R <- ifelse(grepl("Princess",data$players.right.deck, fixed = TRUE), 1, 0)
data$Princess_L_lvl <- ifelse(data$Princess_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Princess.{4})\\d+")[,1])+8, NA)
data$Princess_R_lvl <- ifelse(data$Princess_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Princess.{4})\\d+")[,1])+8, NA)

# Ice Wizard
data$Ice_Wizard_L <- ifelse(grepl("Ice Wizard",data$players.left.deck, fixed = TRUE), 1, 0)
data$Ice_Wizard_R <- ifelse(grepl("Ice Wizard",data$players.right.deck, fixed = TRUE), 1, 0)
data$Ice_Wizard_L_lvl <- ifelse(data$Ice_Wizard_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Ice Wizard.{4})\\d+")[,1])+8, NA)
data$Ice_Wizard_R_lvl <- ifelse(data$Ice_Wizard_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Ice Wizard.{4})\\d+")[,1])+8, NA)

# Bandit
data$Bandit_L <- ifelse(grepl("Bandit",data$players.left.deck, fixed = TRUE), 1, 0)
data$Bandit_R <- ifelse(grepl("Bandit",data$players.right.deck, fixed = TRUE), 1, 0)
data$Bandit_L_lvl <- ifelse(data$Bandit_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Bandit.{4})\\d+")[,1])+8, NA)
data$Bandit_R_lvl <- ifelse(data$Bandit_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Bandit.{4})\\d+")[,1])+8, NA)

# Night Witch
data$Night_Witch_L <- ifelse(grepl("Night Witch",data$players.left.deck, fixed = TRUE), 1, 0)
data$Night_Witch_R <- ifelse(grepl("Night Witch",data$players.right.deck, fixed = TRUE), 1, 0)
data$Night_Witch_L_lvl <- ifelse(data$Night_Witch_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Night Witch.{4})\\d+")[,1])+8, NA)
data$Night_Witch_R_lvl <- ifelse(data$Night_Witch_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Night Witch.{4})\\d+")[,1])+8, NA)

# Inferno Dragon
data$Inferno_Dragon_L <- ifelse(grepl("Inferno Dragon",data$players.left.deck, fixed = TRUE), 1, 0)
data$Inferno_Dragon_R <- ifelse(grepl("Inferno Dragon",data$players.right.deck, fixed = TRUE), 1, 0)
data$Inferno_Dragon_L_lvl <- ifelse(data$Inferno_Dragon_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Inferno Dragon.{4})\\d+")[,1])+8, NA)
data$Inferno_Dragon_R_lvl <- ifelse(data$Inferno_Dragon_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Inferno Dragon.{4})\\d+")[,1])+8, NA)

# Lumberjack
data$Lumberjack_L <- ifelse(grepl("Lumberjack",data$players.left.deck, fixed = TRUE), 1, 0)
data$Lumberjack_R <- ifelse(grepl("Lumberjack",data$players.right.deck, fixed = TRUE), 1, 0)
data$Lumberjack_L_lvl <- ifelse(data$Lumberjack_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Lumberjack.{4})\\d+")[,1])+8, NA)
data$Lumberjack_R_lvl <- ifelse(data$Lumberjack_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Lumberjack.{4})\\d+")[,1])+8, NA)

# Electro Wizard
data$Electro_Wizard_L <- ifelse(grepl("Electro Wizard",data$players.left.deck, fixed = TRUE), 1, 0)
data$Electro_Wizard_R <- ifelse(grepl("Electro Wizard",data$players.right.deck, fixed = TRUE), 1, 0)
data$Electro_Wizard_L_lvl <- ifelse(data$Electro_Wizard_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Electro Wizard.{4})\\d+")[,1])+8, NA)
data$Electro_Wizard_R_lvl <- ifelse(data$Electro_Wizard_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Electro Wizard.{4})\\d+")[,1])+8, NA)

# Graveyard
data$Graveyard_L <- ifelse(grepl("Graveyard",data$players.left.deck, fixed = TRUE), 1, 0)
data$Graveyard_R <- ifelse(grepl("Graveyard",data$players.right.deck, fixed = TRUE), 1, 0)
data$Graveyard_L_lvl <- ifelse(data$Graveyard_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Graveyard.{4})\\d+")[,1])+8, NA)
data$Graveyard_R_lvl <- ifelse(data$Graveyard_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Graveyard.{4})\\d+")[,1])+8, NA)

# Sparky
data$Sparky_L <- ifelse(grepl("Sparky",data$players.left.deck, fixed = TRUE), 1, 0)
data$Sparky_R <- ifelse(grepl("Sparky",data$players.right.deck, fixed = TRUE), 1, 0)
data$Sparky_L_lvl <- ifelse(data$Sparky_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Sparky.{4})\\d+")[,1])+8, NA)
data$Sparky_R_lvl <- ifelse(data$Sparky_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Sparky.{4})\\d+")[,1])+8, NA)

# Lava Hound
data$Lava_Hound_L <- ifelse(grepl("Lava Hound",data$players.left.deck, fixed = TRUE), 1, 0)
data$Lava_Hound_R <- ifelse(grepl("Lava Hound",data$players.right.deck, fixed = TRUE), 1, 0)
data$Lava_Hound_L_lvl <- ifelse(data$Lava_Hound_L == 1, as.numeric(str_match(as.character(data$players.left.deck), "(?<=Lava Hound.{4})\\d+")[,1])+8, NA)
data$Lava_Hound_R_lvl <- ifelse(data$Lava_Hound_R == 1, as.numeric(str_match(as.character(data$players.right.deck), "(?<=Lava Hound.{4})\\d+")[,1])+8, NA)


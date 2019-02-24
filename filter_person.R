raw.age = 54

user.sex = 1 # 1 = male; 2 = female
user.age = max(min(floor((raw.age - 15) / 5), 13), 1) # calculate age group
user.state = 44 # rhode island
  
filtered <- BRFSS %>% filter(
  SEX == user.sex,
  X_AGEG5YR == user.age,
  X_STATE == user.state
)

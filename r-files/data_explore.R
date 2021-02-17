library(tidyverse)
source(here::here("r-files", 'create_rink.R'))
## open up a file and look at it
nwhl_data <- read_csv(here::here("hackathon_nwhl.csv")) %>%
  janitor::clean_names()

## there are only 76 goals in this whole dataset
nwhl_data %>% count(event,sort = T)

## this is 15 games worth of data
nwhl_data %>% count(game_date, home_team, away_team,sort = T)

## open up a file and look at it
womens_data <- read_csv(here::here("hackathon_womens.csv")) %>%
  janitor::clean_names()

## there are only 56 goals in this whole dataset
womens_data %>% count(event,sort = T)

## this is 13 games worth of data
womens_data %>% count(game_date, home_team, away_team,sort = T)

## open up a file and look at it
scouting_data <- read_csv(here::here("hackathon_scouting.csv")) %>%
  janitor::clean_names()

## there are 293 goals in this whole dataset
scouting_data %>% count(event,sort = T)

## this is 40 games worth of data
scouting_data %>% count(game_date, home_team, away_team,sort = T)

## lets look at the x,y data

rink + 
  geom_density2d(data = scouting_data %>%
                   mutate(corr_x = x_coordinate - 100,
                          corr_y = y_coordinate - 42.5) %>%
                   filter(event %in% c("Shot", "Goal")), aes(corr_x, corr_y))

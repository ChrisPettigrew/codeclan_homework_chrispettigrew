medal_plot <- function(team, season){
  olympics_overall_medals %>%
    filter(team == team) %>%
    filter(season == season) %>%
    ggplot() +
    aes(x = medal, y = count, fill = medal) +
    geom_col()
}
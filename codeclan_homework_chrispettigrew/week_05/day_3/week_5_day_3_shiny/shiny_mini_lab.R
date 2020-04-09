library(shiny)
library(dplyr)
library(ggplot2)
library(bbplot)
library(ggflags)
library(CodeClanData)

ui <- fluidPage(theme = "bootstrap.css",
  
  titlePanel(tags$h1("Five Country Medal Comparison")),
  
  tabsetPanel(
    tabPanel("Plot",
             
             plotOutput("medal_plot")),
    
    tabPanel("Which season",
      radioButtons("season",
                   tags$i("Summer or Winter Olympics?"),
                   choices = c("Summer", "Winter")
      )),
      
      tabPanel("Which medal",
      radioButtons("medal",
                   tags$i("Compare Which Medals?"),
                   choices = c("Gold", "Silver", "Bronze")
      )
    ),
    
  tabPanel("Useful links",
  
      
      tags$a("The Olympics website", href = "https://www.Olympic.org/"))
    
  ))


server <- function(input, output) {
  
  output$medal_plot <- renderPlot({
  olympics_overall_medals %>%
    filter(team %in% c("United States",
                       "Soviet Union",
                       "Germany",
                       "Italy",
                       "Great Britain")) %>%
    filter(medal == input$medal) %>%
    filter(season == input$season) %>%
    ggplot() +
    aes(x = team, y = count, fill = medal) +
      bbc_style() +
    geom_col() +
      scale_fill_manual(values = c(
        "Gold" = "#DAA520",
        "Silver" = "#aaa9ad",
        "Bronze" = "#cd7f32")
        )
  })
}

shinyApp(ui = ui, server = server)


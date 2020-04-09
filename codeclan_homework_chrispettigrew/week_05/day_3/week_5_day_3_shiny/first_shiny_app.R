library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)
library(shinythemes)

all_teams <- unique(olympics_overall_medals$team)

ui <- fluidPage(
    
    titlePanel("Olympic Medals"),
    
    
    tabsetPanel(
        tabPanel("Plot",
                 
                 plotOutput("medal_plot")
                 
        ), 
        
        tabPanel("Which season",
                 
                 radioButtons("season",
                              "Summer or Winter Olympics?",
                              choices = c("Summer", "Winter")
                 )
                 
        ), 
        
        tabPanel("Which team?",
                 
                 selectInput("team",
                             "Which Team?",
                             choices = all_teams,
                             selected = "Great Britain"
                 )
                 
        ),
        
        tabPanel("Link to Olympics site",
                 
                 
                 
        )
    )
)

server <- function(input, output) {
    output$medal_plot <- renderPlot({
        olympics_overall_medals %>%
            filter(team == input$team) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = medal, y = count, fill = medal) +
            geom_col()
    })
}

shinyApp(ui = ui, server = server)
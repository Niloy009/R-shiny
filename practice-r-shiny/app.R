library('shiny')
library('shinythemes')

ui <- fluidPage(theme = shinytheme('superhero'),
                navbarPage(
                  "My FirstApp",
                  tabPanel("Navbar 1",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", 'Given Name:', ''),
                             textInput("txt2", 'Surname:')
                           ), #sidebarPanel
                           
                           mainPanel(
                             h1("The output Header"),
                             
                             #output text
                             verbatimTextOutput('txtout'),
                           ) #mainPanel
                           ), #tabPanel
                  tabPanel('Navbar 2', "intentionally empty"),
                  tabPanel("Navbar 3", 'intentionally empty')
                  ) #navbar
                
                )



# Define server function  
server <- function(input, output) {
  
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " " )
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)



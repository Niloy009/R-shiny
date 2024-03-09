library('shiny')
data("airquality")


# UI Panel

ui <- fluidPage(
  
  # app title
  titlePanel("Ozone Data in Histogram"),
  
  # sidebar layout for input and output
  sidebarLayout(
    
    # sidebar input panel
    sidebarPanel(
      
      # Slider input for the number of bins
      sliderInput(inputId = 'bins', 
                  label = 'Number of bins', 
                  min = 1, 
                  max = 50, 
                  value = 30),
      
    ),
    
    # MainPanel for the output in Histogram
     mainPanel(
        plotOutput(outputId = 'distplot')
       
     )
    
  )
  
)



# Server logic required to draw histogram

server <- function(input, output) {
  
  output$distplot <- renderPlot({
    x <- airquality$Ozone
    x <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x,
         breaks = bins, 
         col = 'green', 
         border = 'black', 
         xlab = 'Ozone label', 
         main = ' Histogram of Ozone level')
    
  })
}


# Create Shiny App
shinyApp(ui = ui, server = server)

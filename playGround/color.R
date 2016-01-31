
library(shiny)

# user select main color;
# display opposite colors;
# conduct psychological experiment. record user responses?! response time?
# create a teaching tool, in combination with brushes etc.
# survey. Name this color. ML.


ui <- fluidPage(
  h1("Displaying Colors"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("red", "red", 0, 1, 0.05),
      sliderInput("green", "green", 0, 1, 0.05),
      sliderInput("blue", "blue", 0, 1, 0.05)
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  
  Hist <- hist(1:40, breaks = 20, plot = FALSE)
  
  output$plot <- renderPlot({
    op <- par(mfrow = c(5, 1), mar = c(1, 1, 1, 1))
    barplot(Hist$counts, 
            col = rgb(input$red ^ 2.5, input$green ^ 2.5, input$blue ^ 2.5, seq(0, 1, 0.05)), 
            axes = FALSE)
    
    barplot(Hist$counts, 
            col = rgb(input$red ^ 1.8, input$green ^ 1.8, input$blue ^ 1.8, seq(0, 1, 0.05)), 
            axes = FALSE)
    
    barplot(Hist$counts, 
            col = rgb(input$red, input$green, input$blue, seq(0, 1, 0.05)), 
            axes = FALSE)
    
    barplot(Hist$counts, 
            col = rgb(input$red ^ 0.5, input$green ^ 0.5, input$blue ^ 0.5, seq(0, 1, 0.05)), 
            axes = FALSE)
    
    barplot(Hist$counts, 
            col = rgb(input$red ^ 0.2, input$green ^ 0.2, input$blue ^ 0.2, seq(0, 1, 0.05)), 
            axes = FALSE)
    
    par(op)
  })
  
  
}

shinyApp(ui, server)






# display in R. mini
# user select main color;
# display opposite colors;
# conduct psychological experiment. record user responses?! response time?
# create a teaching tool, in combination with brushes etc.
# survey. Name this color. ML.
# http://color.method.ac


library(shiny)
library(miniUI)


ui <- fluidPage(
  h1("Displaying Colors"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("red", "red", 0, 1, 0.05),
      sliderInput("green", "green", 0, 1, 0.05),
      sliderInput("blue", "blue", 0, 1, 0.05),
      sliderInput("c", "c", 0, 100, 1),
      sliderInput("l", "l", 0, 100, 1)
    ),
    mainPanel(
      plotOutput("plot"),
      plotOutput("plot2")
    )
  )
)

server <- function(input, output, session) {
  # generate a plot space
  
  alpha_value = seq(from = 0.05, to = 1, by = 0.05)
  i = seq_along(alpha_value)
  output$plot <- renderPlot({
    plot(c(0, 20), c(0, 20), type = "n", xlab = "", ylab = "", bty = 'n', axes = F)
    rect(xleft = 0 + i - 1, ybottom = 0, xright = i, ytop = 2, 
         col = rgb(input$red, input$green, input$blue, alpha = alpha_value), 
         border = FALSE)
  })
  output$plot2 <- renderPlot({
    j = 1:200
    plot(c(0, 200), c(0, 40), type = "n", xlab = "", ylab = "", bty = 'n', axes = T)
    rect(xleft = 0 + j - 1, ybottom = 0, xright = j, ytop = 6, 
         col = hcl(h = seq(1, 360, length.out = 200),
                   c = input$c,
                   l = input$l), 
         border = FALSE)
  })
  
  
}

shinyApp(ui, server)


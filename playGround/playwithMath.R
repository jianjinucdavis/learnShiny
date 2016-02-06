library(shiny)

ui <- fluidPage(
  h1("play math"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("a", "a", -10, 10, 1, step = 0.1),
      sliderInput("b", "b", -10, 10, 0)
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)


server <- function(input, output) {
  x = -10:10
  output$plot <- renderPlot({
    y = input$a * x + input$b
    plot(x = x, y = y, cex = 0.2, "l", ylim = c(0, 1), xlim = c(0, 1))
  })
}

shinyApp(ui, server)

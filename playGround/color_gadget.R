# http://shiny.rstudio.com/articles/gadget-ui.html
library(shiny)
library(miniUI)

myColorFunc <- function() {
  
  ui <- miniPage(
    gadgetTitleBar("Displaying Colors"),
    fillCol(flex = c(2, 2, 2, 6),
            div(sliderInput("alpha", "alpha", min = 0, max = 1, value = 0.75), 
                align = "center"),
            div(sliderInput("n", label = "number of colors", min = 7, max = 24, value = 12), 
                align = "center"),
            plotOutput("plot", click = "plot_click"),
            plotOutput("plot_mainColor")
            
    )
    # miniContentPanel(
      # Define layout, inputs, outputs
    #   sidebarPanel(
    #     sliderInput("color", "value", 1, 12, 1),
    #     sliderInput("alpha", "alpha", 0, 1, 0.05)
    #   ),
    #   mainPanel(
    #    plotOutput("plot")
    #  )
    # )
  )
  
  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.
    output$plot <- renderPlot({
      plotRainBow(input$n, input$alpha, axes = F)
    })
    main_colors <- reactive({
      col_index <- floor(input$plot_click[[1]]/2) + 1
      main_col_hex <- colorspace::rainbow_hcl(12)[col_index]
      main_col_rgb <- col2rgb(main_col_hex) / 255
      rgb_matrix <- powerful_color(main_col_rgb)
    })
    
    output$plot_mainColor <- renderPlot({
      plot(c(0, 25), c(0, 24), type = "n", xlab = "", ylab = "", bty = 'n', axes = FALSE)
      alpha_values = seq(0.1, 1, length.out = 12)
      rvalues = main_colors()[1, ]
      gvalues = main_colors()[2, ]
      bvalues = main_colors()[3, ]
      for (i in seq_along(alpha_values)){
        plot_a_row(ybottom = 0 + 2 * i -2, ytop = 2 * i, 
                   red = rvalues, green = gvalues, blue = bvalues,
                   alpha = alpha_values[i])
      }
    })
    
    # When the Done button is clicked, return a value
    # observeEvent(input$done, {
    #  returnValue <- ...
    #  stopApp(returnValue)
    # })
  }
  
  runGadget(ui, server)
}


plotRainBow <- function(n = 12, alpha, axes = TRUE) {
  i = 1:n
  op <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  plot(c(0, 2 * n), c(0, 2), type = "n", xlab = "", ylab = "", bty = 'n', axes = axes)
  rect(xleft = 0 + 2 * i - 2, ybottom = 0, xright = 2 * i, ytop = 2, 
       col = rainbow_hcl(n, alpha = alpha), 
       border = FALSE)
  par(op)
}

powerful_color <- function(x){
  cbind(x ^ 0.2, x ^ 0.3, x ^ 0.5, x ^ 0.6, x ^ 0.8, x, x ^ 1.5, x ^ 2, x ^ 3, x ^ 4, x ^ 5, x^ 6)
}

plot_a_row <- function(ybottom, ytop, red, green, blue, alpha = 1){
  i = 1:12
  rect(xleft = 0 + 2 * i - 2, ybottom, xright = 2 * i, ytop, 
       col = rgb(red, green, blue, alpha), 
       border = FALSE)
}

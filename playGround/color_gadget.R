# http://shiny.rstudio.com/articles/gadget-ui.html
# addin: https://rstudio.github.io/rstudioaddins/
# add insert color
# modulize, clean up
# select pallete
# create a function, display color

library(shiny)
library(miniUI)
library(colorspace)

colorPicker <- function() {
  
  ui <- miniPage(
    gadgetTitleBar("Color Picker"),
    fillCol(flex = c(NA, 1),
            div(plotOutput("plot", 
                           click = "plot_click", 
                           height = "20px", width = "400px"),
                        align = 'center'),
            div(plotOutput("plot2", click = "plot2_click",
                          height = "250px", width = "320px"),
                align = 'center')
    )
  )
  
  server <- function(input, output, session) {
    # Define reactive expressions, outputs, etc.
    output$plot <- renderPlot({
      plotRainBow(24, 0.95, axes = F)
    })
    
    main_colors <- reactive({
      col_index <- floor(input$plot_click[[1]]/2) + 1
      main_col_hex <- rainbow_hcl(24)[col_index]
      main_col_rgb <- col2rgb(main_col_hex) / 255
      rgb_matrix <- powerful_color(main_col_rgb)
    })
    
    output$plot2 <- renderPlot({
      op <- par(mar = c(0, 0, 0, 0))
      plot(c(0, 32), c(0, 24), type = "n", xlab = "", ylab = "", bty = 'n', axes = TRUE)
      alpha_values = seq(0.1, 1, length.out = 12)
      rvalues = main_colors()[1, ]
      gvalues = main_colors()[2, ]
      bvalues = main_colors()[3, ]
      for (i in seq_along(alpha_values)){
        plot_a_row(ybottom = 0 + 2 * i -2, ytop = 2 * i, 
                   red = rvalues, green = gvalues, blue = bvalues,
                   alpha = alpha_values[i])
      }
      # box(lty = '1373', col = 'red')
      par(op)
    })
    
    output$color_info <- renderText({
      str(input$plot2_click)
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
  op <- par(mar = c(0, 0, 0, 0))
  plot(c(0, 2 * n), c(0, 2), type = "n", xlab = "", ylab = "", bty = "n", axes = axes)
  rect(xleft = 0 + 2 * i - 2, ybottom = 0, xright = 2 * i, ytop = 2, 
       col = rainbow_hcl(n, alpha = alpha), 
       border = FALSE)
  par(op)
}

powerful_color <- function(x){
  x <- abs(x - 0.01)
  cbind(x ^ 0.05, x ^ 0.1, x ^ 0.2, x ^ 0.3, 
        x ^ 0.4, x ^ 0.6, x ^ 0.8, x ^ 1, 
        x ^ 1.5, x ^ 2, x ^ 3, x ^ 4, 
        x ^ 5, x ^ 6.5, x ^ 8, x ^ 10)
}

plot_a_row <- function(ybottom, ytop, red, green, blue, alpha = 1){
  i = 1:16
  rect(xleft = 0 + 2 * i - 2, ybottom, xright = 2 * i, ytop, 
       col = rgb(red, green, blue, alpha), 
       border = FALSE)
}


# ,
# div(verbatimTextOutput("color_info"),
#     align = 'center')
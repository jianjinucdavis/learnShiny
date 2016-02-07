library(plotrix)
# get an empty box
plot(0:10,type="n",axes=FALSE)
# run across the three primaries
gradient.rect(1,0,3,6,reds=c(1,0),
              greens=c(seq(0,1,length=10),seq(1,0,length=10)),
              blues=c(0,1),gradient="y")
# now a "danger gradient"
gradient.rect(4,0,6,6,c(seq(0,1,length=10),rep(1,10)),
              c(rep(1,10),seq(1,0,length=10)),c(0,0),gradient="y")
# now just a smooth gradient across the bar
gradient.rect(7,0,9,6,col=smoothColors("red",38,"blue"),border=NA)




library(RColorBrewer)
par(mar = c(0, 4, 0, 0))
display.brewer.all()
colors() 
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf
# https://github.com/karthik/wesanderson
# http://blenditbayes.blogspot.com/2014/05/towards-yet-another-r-colour-palette.html
# https://kbroman.wordpress.com/2014/05/09/further-points-on-crayon-colors/
# http://blenditbayes.blogspot.com/2014/05/towards-yet-another-r-colour-palette.html
# http://www.w3schools.com/colors/colors_names.asp
# http://blog.plot.ly/post/125942000947/how-to-analyze-data-6-useful-ways-to-use-color-in
library("colorspace")
pal <- choose_palette()
i = 1:12
j = 1:10


a <-col2rgb("#FF10FF") / 255
rgb(a[1], a[2], a[3])
colorRamp()
?colorRampPalette
colorRampPalette(c("#FF0000"))( 4 )

??palette

powerful_color <- function(x){
  sort(seq((1-x), x, length.out = 12))
}

col_matrix <- col2rgb("orange") / 255

main_cols_matrix <- apply(col_matrix, 1, powerful_color)
main_cols_matrix[, 'red']

powerful_color(col_matrix)

x <- sort(runif(100))

y = exp(x)

plot(x = x, y = x ^ 150, "l")



powerful_color <- function(x){
  cbind(x ^ 0.5, x ^ 0.8, x ^ 1, x ^ 2, x ^ 3, x ^ 5, x ^ 8, x ^ 10, x ^ 25, x ^ 50, x ^ 80, x ^ 100)
}

col_matrix <- powers(a - 0.001)

i = 1:12
plot(c(0, 25), c(0, 24), type = "n", xlab = "", ylab = "", bty = 'n', axes = TRUE)

i = 1:12
plot_a_row <- function(ybottom, ytop, red, green, blue, alpha = 1){
  i = 1:12
  rect(xleft = 0 + 2 * i - 2, ybottom, xright = 2 * i, ytop, 
       col = rgb(red, green, blue, alpha), 
       border = FALSE)
}

alpha_values = seq(0.1, 1, length.out = 12)
rvalues = col_matrix[1, ]
gvalues = col_matrix[2, ]
bvalues = col_matrix[3, ]

plot_a_row(ybottom = 0, ytop = 2, 
           red = rvalues, 
           green = gvalues, 
           blue = bvalues, 
           alpha = alpha_values[1])
plot_a_row(ybottom = 8, ytop = 10, 
           red = rvalues, 
           green = gvalues, 
           blue = bvalues, 
           alpha = alpha_values[5])

for (i in 1:length(alpha_values)){
  plot_a_row(ybottom = 0 + 2 * i -2, ytop = 2 * i, 
             red = rvalues, green = gvalues, blue = bvalues,
             alpha = alpha_values[i])
}

graphics.off()


plotRainBow <- function(n = 12, alpha, axes = TRUE) {
  plot(c(0, 25), c(0, 5), type = "n", xlab = "", ylab = "", bty = 'n', axes = axes)
  rect(xleft = 0 + 2 * i - 2, ybottom = 0, xright = 2 * i, ytop = 4, 
       col = colorspaces::rainbow_hcl(n, alpha = alpha), 
       border = FALSE)
}


plotRainBow(0.1, axes = FALSE)

graphics.off()
?hcl
?s
?hcl
hsl(1:10, 0.1, 0.1)
colorRamp(c("red", "green"))( (0:4)/4 ) ## (x) , x in [0,1]
colorRampPalette(c("yellow", "red"))(4)
plot(c(100, 250), c(300, 450), type = "n", xlab = "", ylab = "",
     main = "2 x 11 rectangles; 'rect(100+i,300+i,  150+i,380+i)'")
rgb.palette <- colorRampPalette(c("red", "orange", "blue"),
                                space = "rgb")
rgb.palette(10)

i <- 4*(0:10)
## draw rectangles with bottom left (100, 300)+i
## and top right (150, 380)+i
rect(100+i, 300+i, 150+i, 380+i, col = rainbow(11, start = 0.7, end = 0.1))
rect(240-i, 320+i, 250-i, 410+i, col = heat.colors(11), lwd = i/5)
?rainbow
plot(c(0, 20), c(0, 20), type = "n", xlab = "", ylab = "", bty = 'n', axes = F)

plot(c(0, 20), c(0, 20), type = "n", xlab = "", ylab = "", bty = 'n', axes = T)
alpha_value = seq(from = 0.05, to = 1, by = 0.05)
i = seq_along(alpha_value)
rect(xleft = 0 + i - 1, ybottom = 0, xright = i, ytop = 2, 
     col = rgb(0, 1, 0, alpha = alpha_value), 
     border = FALSE)


graphics.off()

col2rgb(rainbow(10))


install.packages("googleVis")
library(googleVis)
Fruits
m <- gvisMotionChart(Fruits, 'Fruit', 'Year', options = list(width = 600, height = 400))

plot(m)


devtools::install_github('ramnathv/rCharts')

library(rCharts)


names(iris) = gsub("\\.", "", names(iris))
rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')

rPlot

haireye = as.data.frame(HairEyeColor)
head(haireye)
rPlot(Freq ~ Hair | Eye, color = 'Eye', data = haireye, type = 'bar')

n1 <- nPlot(Freq ~ Hair, group = 'Eye', type = 'bar')
nPlot


library(manipulate)
manipulate(plot(1:x), x = slider(min = 1, max = 100))
x = seq(-10, 10, 0.2)

manipulate(plot(x ^ p ~ x, type = "l"), p = slider(min = -3, max = 3, step = 0.5))

manipulate(plot(x ^ p ~ x, 
                type = "l",
                col = rgb(red = 1, green = 0, blue = 0, alpha = 1)),
           p = slider(min = -3, max = 3, step = 0.1))

x ^ -2.5
x ^ -1
x ^ 0
x ^ 0.5
x ^ 0.33
x ^ 2

x ^ 0.33

-10 ^ 2



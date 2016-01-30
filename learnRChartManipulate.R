install.packages("googleVis")
library(googleVis)
Fruits
m <- gvisMotionChart(Fruits, 'Fruit', 'Year', options = list(width = 600, height = 400))

plot(m)



library(manipulate)
x <- sample(0:1, 100, TRUE)
x
?rbinom

rnorm(100, 1)

x <- sort(runif(100, 0, 1))

plot(x ~ x, col = rgb(0, 0, x))

plot(x ~ x, col = rgb(0, 0, x))

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



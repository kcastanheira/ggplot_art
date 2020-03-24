library(dplyr)
library(ggplot2)

image_data = read.csv("~/Documents/ggplot_art/imagedata/image1.csv")
image_dimensions = read.csv("~/Documents/ggplot_art/imagedata/size_image1.csv")

image_data$X = rep(1:image_dimensions$width, image_dimensions$height)
image_data$Y = rev(rep(1:image_dimensions$height, each=image_dimensions$width))

image_data$R = image_data$R/255
image_data$G = image_data$G/255
image_data$B = image_data$B/255
image_data$L=0.2126*image_data$R+0.7152*image_data$G+0.0722*image_data$B

temp = sample(1:nrow(image_data), 300000)
temp = image_data[temp,]

temp %>%
  ggplot(aes(X, Y, color=L, alpha=0.1)) +
  geom_point(shape=20, size=0.25) + theme_minimal() + coord_fixed() + 
  scale_color_gradientn(colours=c("black", "white"))


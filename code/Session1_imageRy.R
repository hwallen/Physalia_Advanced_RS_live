# Code related to the use of imageRy package

# Data visualization

library(terra)
library(imageRy)

# devtools::install_github("ducciorocchini/imagery")

# List the data

im.list()

b2 <- im.import("sentinel.dolomites.b2.tif")

# Make a cube
sent <- im.import("sentinel.dolomites")

#b2: Blue
#b3: Green
#b4: Red
#b8: NIR

im.plotRGB(sent, r = 3, g = 2, b = 1, title = "Natural color") # Natural color image

im.plotRGB(sent, r = 4, g = 3, b = 2, title = "NIR - false") # False color

im.plotRGB(sent, r = 3, g = 4, b = 2, title = "NIR - false") # False color

im.plotRGB(sent, r = 3, g = 2, b = 4, title = "NIR - false") # False color

# 8 bit image
# 0-255 (2^8 = 256)
# nir - red = 255 - 0 = 255


dvi_sent <- im.dvi(sent, 4, 3)

# 4 bit image
# 0-16 (2^4 = 16)
# nir - red = 15-0 = 15

ndvi_sent <- im.ndvi(sent, 4,3)

# Deforestation of Mato grosso

# Multitemporal visualization

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

im.plotRGB(m1992, r = 2, g = 1, b = 3)
im.plotRGB(m2006, r = 2, g = 1, b = 3)

ndvi1992 <- im.ndvi(m1992, 1,2)
ndvi2006 <- im.ndvi(m2006, 1,2)

# pairplot (correlation)

pairs(m1992)
pairs(m2006)


# Classification
m1992c <- im.classify(m1992, num_clusters  = 2)
m2006c <- im.classify(m2006, num_clusters  = 2)

# Frequencies

f1992 <- freq(m1992c)
p1992 <- f1992 / ncell(m1992)

f2006 <- freq(m2006c)
p2006 <- f2006 / ncell(m2006)

install.packages("mapproj")
require(maps)
require(ggmap)

mass = county.fips[grepl("massachusetts",county.fips[,2]),]
head(mass)
colors = rev(heat.colors(7))
s = read.csv("masscase.csv",sep = ' ',header = FALSE)

mass1 = cbind(mass,s[-nrow(s),2])
colnames(mass1)[3] = 'case'

mass1$colorBuckets <- as.numeric(cut(mass1$case, c(0,100,200,500,1500,2000,3000,6000)))


colorsmatched <- mass1$colorBuckets

map("county","massachusetts", col = colors[colorsmatched], fill = TRUE, resolution = 0, 
    lty = 1,lwd = 0.2, projection = "polyconic")
title("Coivd-19 cases in Massachusetts")

leg.txt <- c("0-100", "100-200", "200-500", "500-1500", "2000-3000", "3000-6000")
par(xpd=TRUE)
legend("bottomleft",bg="transparent",leg.txt, horiz = FALSE, fill = colors,box.lty = 0)



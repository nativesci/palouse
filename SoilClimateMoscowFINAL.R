# load data 
x <- read.table("C:/Users/cleve/OneDrive/Code/ClimateDiagram/Moscow_UOI_Climate_New2013.csv", header=TRUE, sep=",")
# need to figure out range from data
y.range <- range(c(x$Month, 250))

# interpolate between month centers
month.start <- 1
month.end <- 12

# setup plot area
par(mar=c(4,4,4,5))
plot(0, 0, type='n', xlim=c(0.5, 12.5), ylim=c(y.range), 
ylab='PPT and PET (mm)', xlab='Month', axes=FALSE)
axis(side=2, las=1)
axis(side=1, at=1:12)
grid()

#Deficit polygon
xx1 <- c(1, x$Month, 12)
yy1 <- c(0, x$Deficit, 0)
polygon(xx1, yy1, col="gold", border=NA)

#transparent blue
blutrans <- rgb(0, 191, 255, 127,  maxColorValue=255) 
# Soil moisture
xx <- c(1, x$Month, 12)
yy <- c(0, x$SoilM, 0)
polygon(xx, yy, col=blutrans, border=NA)

# add original PPT and PET data
lines(x$PPT ~ x$Month, col='blue', type='l', lwd=4)
lines(x$PET ~ x$Month, type='l', lwd=3, lty=3)

#add temp column
par(new=TRUE)
plot(x$TEMPC, type="o", xlim=c(0.5, 12.5), ann=FALSE, axes=FALSE, pch = 19)
axis(4)
mtext("TEMP(C)", side=4, srt=180, line=2.5)

# add legend
legend('topleft', legend=c('Soil Water Storage', 'Soil Water Deficit', 'Storage/Deficit Transition', 'Precp', 'Temp', 'PET'), 
col=c("skyblue", "gold",'palegreen3', 'blue', 'black', 'black'), pch=c(15, 15,15, NA, 16, NA), pt.cex=1.3, lwd=c(NA, NA,NA, 3, 3, 3), lty=c(NA, NA,NA, 1, 1, 2), bty='n')
#add title
title("Soil-Climate Diagram (Moscow, Idaho)") 

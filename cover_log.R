rm(list=ls()) 
t <- read.table("C:/Users/cleve/OneDrive/FinalDatasets/DissertationData/final.quadrat.data.csv", 
	header=T, sep=",")

colnames(t)<-c("site","sp","class","elv","aspect","depth","slope","H")

###BSC
library(ggplot2)
t=subset(t,sp=="BSC")
ggplot(t,aes(factor(class), H))+
	geom_boxplot()+ 
	geom_smooth(aes(group=1))+ 
	geom_point()+labs(x="BSC Cover Class", y="H")

#ggplot elv
library(ggplot2)
ggplot(t,aes(factor(class), elv))+
	geom_boxplot()+ 
	geom_smooth(aes(group=1))+ 
	geom_point()+labs(x="BSC Cover Class", y="Elevation (m)")

#ggplot aspect
ggplot(t,aes(factor(class), cos(aspect)))+
	geom_boxplot()+ 
	geom_smooth(aes(group=1))+ 
	geom_point()+labs(x="BSC Cover Class", y="Cosine Aspect")

#ggplot soil depth
ggplot(t,aes(factor(class), depth))+
	geom_boxplot()+ 
	geom_smooth(aes(group=1))+ 
	geom_point()+labs(x="BSC Cover Class", y="Soil Depth (cm)")

#ggplot slope
ggplot(t,aes(factor(class), slope))+
	geom_boxplot()+ 
	geom_smooth(aes(group=1))+ 
	geom_point()+labs(x="BSC Cover Class", y="slope")


###Diversity, elevation, aspect, soild depth, slope, and nngrs to predict BSC
library(MASS)
m<-polr(as.factor(class)~H+depth+elv+aspect+slope, data=t, Hess=TRUE)
summary(m)
(ctable<-coef(summary(m)))
#Claculate and store p-values
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
#Combine table
(ctable <- cbind(ctable, "p value" = p))
#Get CIs
(ci <- confint(m))
###odds ratios
exp(coef(m))
##Odds ratios and CI
exp(cbind(OR=coef(m),ci))






#Biotic resistance BSC to predict diversity
library(MASS)
n<-polr(H~as.factor(class), data=x, Hess=TRUE)
summary(n)
(ctable<-coef(summary(n)))
#Claculate and store p-values
p <- pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
#Combine table
(ctable <- cbind(ctable, "p value" = p))
#Get CIs
(ci <- confint(n))
###odds ratios
exp(coef(n))
##Odds ratios and CI
exp(cbind(OR=coef(n),ci))








bsc=subset(cover, SPECIES=="BSC")
data<-subset(cover, SITE=='196'|SITE=='199'|SITE=='238'|SITE=='239'|SITE=='303'|
SITE=='529'|SITE=='566'|SITE=='734'|SITE=='801'|SITE=='848'|SITE=='933'|SITE=='979'|
SITE=='987'|SITE=='1081'|SITE=='1100'|SITE=='1516'|SITE=='1091a'|SITE=='1091b'|
SITE=='1091c'|SITE=='1091d'|SITE=='1100c'|SITE=='1211a'|SITE=='1211b'|SITE=='1211g'|
SITE=='1211i'||SITE=='1516a'|SITE=='1516b'|SITE=='1516c'|SITE=='1516d'|SITE=='1571e'|
SITE=='1571i'|SITE=='1571k'|SITE=='1571n'|SITE=='1571o'|SITE=='1571p'|SITE=='1571q'|
SITE=='1571s'|SITE=='199a'|SITE=='199b'|SITE=='199c'|SITE=='199f'|SITE=='199g'|SITE=='529a'|
SITE=='529c'|)
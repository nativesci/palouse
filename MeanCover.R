###SW Diversity
rm(list=ls()) 
cover <- read.table("C:/Users/cleve/OneDrive/FinalDatasets/DissertationData/final_palouse_cover.csv", 
	header=T, sep=",")
attach(cover)
head(cover)
palouse=cover[,-c(2:13)]
head(palouse)
m<-cbind(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11)
m[m==1]=2.5
m[m==2]=8.75
m[m==3]=18.75
m[m==4]=37.5
m[m==5]=62.5
m[m==6]=87.5
head(m)
xx=as.matrix(m)
head(xx)
data=data.frame(palouse,xx)
head(data)
cover=subset(data, SPECIES!="NF" & SPECIES!="NNF" & SPECIES!="LT"
	& SPECIES!="NGRS" & SPECIES!="NNGRS" & SPECIES!="UNK" & SPECIES!="UNK"
	& SPECIES!="BG" & SPECIES!="RK" & SPECIES!="SHRB" & SPECIES!="BSC"
	& SPECIES!="MUSHROOM") 
c.data=rowMeans(cover[,7:18])
head(c.data)
j2=data.frame(round(c.data,digits=3),cover[,-c(7:18)])
names(j2)=c("cover","species","site","elv","aspect","depth","slope")
head(j2)
attach(j2)
#write.table (j2, file="D:/Dropbox/DissertationData/InterrelationshipsPaper/species.cover.csv", row.names=T, sep = ",")

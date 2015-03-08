# Contains the scripts for Emily's data analysis
setwd("/Users/arindambose/Documents")
require(foreign)
require(reshape)
#emdata <- read.spss("grathlm.sav", to.data.frame = TRUE)
#attach(emdata)
#print(names(emdata))
#print(length(emdata$ID))
#print(table(Gender))
#detach(emdata)

## write.csv(emdata, file = "emdata.csv",
 ##         row.names = FALSE)

emsdata <- read.csv("emdata.csv")
print(names(emsdata))
print(table(emsdata$Time))
emsdata <- emsdata[,c(2:21)]
# print(names(emsdata))
##emsdata2 <- melt(emsdata, id = c("ID2", "Time"))
##print(names(emsdata2))

# print(length(emsdata2$ID2))

wideems <- reshape(emsdata, v.names = "GRATCONT",
                   idvar = "ID2", timevar = "Time",
                   direction = "wide")

print(names(wideems))
print(length(wideems$ID2))
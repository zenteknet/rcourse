datatest = data.frame(hospital=c("A", "B", "C", "D", "E"),
                      state=c("TX", "CA", "WY", "CO", "TX"),
                      heart_attack=c(13,NA,12,30,42),
                      heart_failure=c(20,23,34,NA,32),
                      pneumonia = c(15,12,34,NA,5))

datastate = subset(datatest,state=="TX")    # returns table of TX values

datatest[ , "heart_attack"] > 20
max(datatest$heart_attack, na.rm = TRUE)
index = datatest[ , "heart_attack"] == min(datatest$heart_attack, na.rm = TRUE)

datatest[index,]
x = datatest[index,]
x$hospital
datatest[index,]$hospital
datatest[index,][ , 1]

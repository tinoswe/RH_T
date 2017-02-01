library(gdata)
getwd()
df <- read.xls("XLS_Files/MOB_Jan_2016.xlsx",
               sheet=1,
               header=TRUE)

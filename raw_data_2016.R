library(gdata)
getwd()
df <- read.xls("XLS_Files/MOB_Jan_2016.xlsx",
               sheet=1,
               header=TRUE,
               as.is=TRUE)

df$XT2 <- strptime(df$XT2,
                   format="%d/%m/%Y %H:%M:%S")
df$XT3 <- strptime(df$XT3,
                   format="%d/%m/%Y %H:%M:%S")
df$XT4 <- strptime(df$XT4,
                   format="%d/%m/%Y %H:%M:%S")
df$XT5 <- strptime(df$XT5,
                   format="%d/%m/%Y %H:%M:%S")

plot(df$XT2,
     df$T2,
     type="l",
     col="darkred",
     ylim=c(10,30),
     xlab="",
     ylab="Degrees [°C]",
     main="Temperature - Jan 2016")
lines(df$XT3,
      df$T3,
      col="darkblue")
lines(df$XT4,
      df$T4,
      col="darkgreen")
lines(df$XT5,
      df$T5,
      col="darkviolet")

legend("topright",
       c("MOB 2",
         "MOB 3",
         "MOB 4",
         "MOB 5"),
       lty=c(1,1,1,1),
       col=c("darkred",
             "darkblue",
             "darkgreen",
             "darkviolet"),
       bty="n")
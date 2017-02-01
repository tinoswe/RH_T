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

#temperature

plot(df$XT2,
     df$T2,
     type="l",
     col="darkred",
     ylim=c(10,30),
     xlab="",
     ylab="Gradi [°C]",
     main="Temperature reparto MOB - Gennaio 2016")
lines(df$XT3,
      df$T3,
      col="darkblue")
lines(df$XT4,
      df$T4,
      col="darkgreen")
lines(df$XT5,
      df$T5,
      col="darkviolet")

abline(h=15,
       col="red",
       lwd=2)

abline(h=25,
       col="red",
       lwd=2)

legend("top",
       c("MOB 2",
         "MOB 3",
         "MOB 4",
         "MOB 5"),
       lty=c(1,1,1,1),
       col=c("darkred",
             "darkblue",
             "darkgreen",
             "darkviolet"),
       bty="n",
       horiz=TRUE)

#umidità

plot(df$XT2,
     df$HR2,
     type="l",
     col="darkred",
     ylim=c(0,80),
     xlab="",
     ylab="Umidità [%HR]",
     main="Umidità reparto MOB - Gennaio 2016")
lines(df$XT3,
      df$HR3,
      col="darkblue")
lines(df$XT4,
      df$HR4,
      col="darkgreen")
lines(df$XT5,
      df$HR5,
      col="darkviolet")

abline(h=45,
       col="red",
       lwd=2)

abline(h=55,
       col="red",
       lwd=2)

legend("top",
       c("MOB 2",
         "MOB 3",
         "MOB 4",
         "MOB 5"),
       lty=c(1,1,1,1),
       col=c("darkred",
             "darkblue",
             "darkgreen",
             "darkviolet"),
       bty="n",
       horiz=TRUE)

##get percentage f samples within 15-25 range
#100*(length(df$T2[df$T2 > 15 && df$T2 < 25])/length(df$T2))


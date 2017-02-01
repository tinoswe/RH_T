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

##get percentage f samples within 45-55 range
phr2 <- round(100. * length(df$HR2[(df$HR2 > 45) & (df$HR2 < 55)]) / length(df$HR2),1)
phr3 <- round(100. * length(df$HR2[(df$HR3 > 45) & (df$HR3 < 55)]) / length(df$HR3),1)
phr4 <- round(100. * length(df$HR2[(df$HR4 > 45) & (df$HR4 < 55)]) / length(df$HR4),1)
phr5 <- round(100. * length(df$HR2[(df$HR5 > 45) & (df$HR5 < 55)]) / length(df$HR5),1)

legend("top",
       c(paste("MOB 2: ",phr2,"% w.r."),
         paste("MOB 3: ",phr3,"% w.r."),
         paste("MOB 4: ",phr4,"% w.r."),
         paste("MOB 5: ",phr5,"% w.r.")),
       lty=c(1,1,1,1),
       col=c("darkred",
             "darkblue",
             "darkgreen",
             "darkviolet"),
       bty="n",
       horiz=TRUE,
       cex=.7)


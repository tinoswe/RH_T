library(gdata)

#read xlsx files
fnames <- list.files("XLS_Files")

#loop over files
df <- read.xls(paste("XLS_Files/",fnames[1],sep=""),
               sheet=1,
               header=TRUE,
               as.is=TRUE
               #,nrows = 10
               )
df$XT2 <- strptime(df$XT2,
                   format="%d/%m/%Y %H:%M:%S")
df$XT3 <- strptime(df$XT3,
                   format="%d/%m/%Y %H:%M:%S")
df$XT4 <- strptime(df$XT4,
                   format="%d/%m/%Y %H:%M:%S")
df$XT5 <- strptime(df$XT5,
                   format="%d/%m/%Y %H:%M:%S")

#loop over files and add to main frame
i <- 1
for(f in fnames){
  if ((f != fnames[1]) && (substr(f,1,3)=="MOB")) { 
    
    df_tmp <- read.xls(paste("XLS_Files/",f,sep=""),
                       sheet=1,
                       header=TRUE,
                       as.is=TRUE
                       #,nrows=10
                       )
    df_tmp$XT2 <- strptime(df_tmp$XT2,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XT3 <- strptime(df_tmp$XT3,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XT4 <- strptime(df_tmp$XT4,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XT5 <- strptime(df_tmp$XT5,
                           format="%d/%m/%Y %H:%M:%S")

    #append to main frame
    df <- rbind(df,
                df_tmp)
    #delete df_tmp
    rm(df_tmp)
        
    }
  i <- i+1
}

df<-df[order(df[1]),]
df

NI<-91806
NP<-120530
df$XT2[NP]
#jan-mar 1:32680
#apr-jun 32681:58708
#jul-sep 58709:91805
#sep-dec 91806:end

plot(df$XT2[NI:NP],
     df$T2[NI:NP],
     type="l",
     col="darkred",
     ylim=c(10,30),
     xlab="",
     ylab="Gradi [°C]",
     main="Temperature reparto MOB: Ottobre - Dicembre 2016")
lines(df$XT3[NI:NP],
      df$T3[NI:NP],
      col="darkblue")
lines(df$XT4[NI:NP],
      df$T4[NI:NP],
      col="darkgreen")
lines(df$XT5[NI:NP],
      df$T5[NI:NP],
      col="darkviolet")

abline(h=15,
       col="red",
       lwd=2)

abline(h=25,
       col="red",
       lwd=2)

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
       bty="n",
       horiz=FALSE,
       cex=.9)

#umidità

NI<-91806
NP<-120530
#jan-mar 1:32680
#apr-jun 32681:58708
#jul-sep 58709:91805
#sep-dec 91806:120530

plot(df$XT2[NI:NP],
     df$HR2[NI:NP],
     type="l",
     col="darkred",
     ylim=c(0,100),
     xlab="",
     ylab="Umidità [%HR]",
     main="Umidità reparto MOB: Ottobre - Dicembre 2016")
lines(df$XT3[NI:NP],
      df$HR3[NI:NP],
      col="darkblue")
lines(df$XT4[NI:NP],
      df$HR4[NI:NP],
      col="darkgreen")
lines(df$XT5[NI:NP],
      df$HR5[NI:NP],
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

legend("topright",
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
       horiz=FALSE,
       cex=.9)




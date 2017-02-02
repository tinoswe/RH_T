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

plot(df$XT2,
     df$T2,
     type="l",
     col="darkred",
     ylim=c(10,30),
     xlab="",
     ylab="Gradi [°C]",
     main="Temperature reparto MOB - 2016")
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

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
    df_tmp$XHR2 <- strptime(df_tmp$XHR2,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XHR3 <- strptime(df_tmp$XHR3,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XHR4 <- strptime(df_tmp$XHR4,
                           format="%d/%m/%Y %H:%M:%S")
    df_tmp$XHR5 <- strptime(df_tmp$XHR5,
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

drops <- c("XT3",
           "XT4",
           "XT5",
           "XHR2",
           "XHR3",
           "XHR4",
           "XHR5")
df <- df[ , !(names(df) %in% drops)]


write.csv(df,
          file="CSV_Files/all_data.csv",
          row.names = FALSE)
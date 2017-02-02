#Make simple chart
df <- read.csv(file="CSV_Files/all_data.csv", 
               header=TRUE, 
               sep=",")

plot(df$T2[1:2000],
     type="l",
     col="red",
     xlab="",
     ylab="",
     xaxt="n",
     yaxt="n",
     bty="n",
     ylim=c(15,22))
lines(df$T3[1:2000],
      col="darkblue")
lines(df$T4[1:2000],
      col="darkgreen")
lines(df$T5[1:2000],
      col="violet")
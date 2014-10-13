setwd("~/crawer");

setwd("~/crawer");

data <- read.csv("google_trends/google_trends.csv", header=FALSE);
#data[1,1];
#data[1,] #1行目のデータ
uniqdates = unique(data[,1]) #1列目
uniqdates

topics = data[,2]
uniqtopics = unique(topics) #Topics：2列目
uniqtopics



cnt <- c(0)

for(uniqtopic in uniqtopics){
  i <- 0
  cat("uniqtopic:", uniqtopic)
  for(topic in topics){
    if(uniqtopic == topic){
        i <- i + 1
    }
    cnt <- c(cnt,i)
  }
}

for( j in 1:length(ids)){
  eval(parse(text=paste(ids[j],"<-data[(data$V1==ids[",j,"]),]",sep="")))  
}

ylim_array <- ids
ylim_array <- as.vector(ylim_array)

for(j in 1:length(ylim_array)){
  ylimvar = (text=paste(ylim_array[j] , '_ylim', sep=""));
  ylim_array <- replace(ylim_array, c(j), ylimvar);
}
#ylim_array
j=1
for( j in 1:length(ids)){
  eval(parse(text=paste(ylim_array[j] "<- c(min(ids[", j, "]$V2,min(ids[", j ,"]$V3)),max(ids[", j ,"]$V2,ids[", j, "]$V3))")))
  jpeg(".jpg", height=500, width=500)
  plot(USDJPY$V4,USDJPY$V2,type='l',ylim=USDJPY_ylim, col="blue")
  par(new=T)
  plot(USDJPY$V4,USDJPY$V3,type='l',ylab="",ylim=USDJPY_ylim,col="red")
}

EURJPY_ylim <- c(min(EURJPY$V2,min(EURJPY$V3)),max(EURJPY$V2,EURJPY$V3))
plot(EURJPY$V4,EURJPY$V2,type='l',ylim=EURJPY_ylim, col="blue")
par(new=T)
plot(EURJPY$V4,EURJPY$V3,type='l',ylab="",ylim=EURJPY_ylim,col="red")


AUDJPY _ylim <- c(min(AUDJPY$V2,min(AUDJPY$V3)),max(AUDJPY$V2,AUDJPY$V3))
plot(AUDJPY$V4,AUDJPY$V2,type='l',ylim=EURJPY_ylim, col="blue")
par(new=T)
plot(AUDJPY$V4,AUDJPY$V3,type='l',ylab="",ylim=AUDJPY_ylim,col="red")


x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)

jpeg("test1.jpg", height=500, width=500)
plot(x, y)                                   # グラフを描く
points(x, y)
dev.off()                                    # 描画デバイスを閉じる

#Load data into table
dat<-read.table('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors=FALSE)
#Subset data to relevant dates
dat<-dat[dat$Date=='1/2/2007'| dat$Date=='2/2/2007',]
#Format date
dat$Date<-as.Date(dat$Date,format='%d/%m/%Y')

#Plot 1
x11()
hist(as.numeric(dat$Global_active_power), col='red',breaks=15, main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.copy(png,file='figure/plot1.png')
dev.off()

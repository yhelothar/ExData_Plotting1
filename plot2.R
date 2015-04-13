#Load data into table
dat<-read.table('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors=FALSE)
#Subset data to relevant dates
dat<-dat[dat$Date=='1/2/2007'| dat$Date=='2/2/2007',]
#Format date
dat$Date<-as.Date(dat$Date,format='%d/%m/%Y'
t<-strptime(paste(dat$Date,dat$Time),'%Y-%m-%d %H:%M:%S')

#Plot 2
x11()
plot(t,dat$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
dev.copy(png,file='figure/plot2.png')
dev.off()
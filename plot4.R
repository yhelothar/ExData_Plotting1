#Load data into table
dat<-read.table('household_power_consumption.txt',sep=';',header=TRUE, stringsAsFactors=FALSE)
#Subset data to relevant dates
dat<-dat[dat$Date=='1/2/2007'| dat$Date=='2/2/2007',]
#Format date
dat$Date<-as.Date(dat$Date,format='%d/%m/%Y'
t<-strptime(paste(dat$Date,dat$Time),'%Y-%m-%d %H:%M:%S')

#Plot 4
x11()
par(mfrow=c(2,2))
plot(t,dat$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
plot(t,dat$Voltage,type='l',ylab='Voltage',xlab='datetime')
plot(t,as.numeric(dat$Sub_metering_1),col='black',type='l',ylab='Energy sub metering',xlab='')
lines(t,as.numeric(dat$Sub_metering_2),col='red')
lines(t,as.numeric(dat$Sub_metering_3),col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend=names(dat)[7:9])
plot(t,dat$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')
dev.copy(png,file='figure/plot4.png')
dev.off()
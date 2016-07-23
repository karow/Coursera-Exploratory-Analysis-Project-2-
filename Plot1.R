# Plot1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum of all Emissions for each year
sum1999 <- sum(NEI[NEI$year == 1999,'Emissions'])
sum2002 <- sum(NEI[NEI$year == 2002,'Emissions'])
sum2005 <- sum(NEI[NEI$year == 2005,'Emissions'])
sum2008 <- sum(NEI[NEI$year == 2008,'Emissions'])

dates <- c('1999', '2002', '2005', '2008')
sums <- c(sum1999, sum2002, sum2005, sum2008)

plot1 <- plot(dates, sums, ylab = 'PM2.5 Emission in Tons', xlab = 'Year', main = 'PM2.5 Emission in the US')

dev.copy(png,'plot1.png')
dev.off()

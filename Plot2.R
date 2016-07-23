# Plot2: Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the basge plottin
# system to make a plot answering this question. 

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum of all Emissions for each year in Baltimore City
bal1999 <- sum(NEI[NEI$fips == "24510" & NEI$year == 1999, "Emissions"])
bal2002 <- sum(NEI[NEI$fips == "24510" & NEI$year == 2002, "Emissions"])
bal2005 <- sum(NEI[NEI$fips == "24510" & NEI$year == 2005, "Emissions"])
bal2008 <- sum(NEI[NEI$fips == "24510" & NEI$year == 2008, "Emissions"])

balsums <- c(bal1999,bal2002,bal2005,bal2008)
dates <- c('1999', '2002', '2005', '2008')

plot2 <- plot(dates, balsums, ylab = 'PM2.5 Emission in Tons', xlab = 'Year', main = 'PM2.5 Emission in Baltimore City')

dev.copy(png,'plot2.png')
dev.off()
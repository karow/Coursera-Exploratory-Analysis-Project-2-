# Plot 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Finding all sources that contain the word 'motor' 
find_motor_vehicle <- grep(pattern = '.*motor*', x = SCC$SCC.Level.Three, ignore.case = TRUE, value = F)

# All SCC numbers for the sources that contain the word 'motor'
scc_motor <- SCC[find_motor_vehicle,'SCC']

# Subsetting the NEI Data Set 
motordata <- NEI[NEI$fips == "24510" & NEI$SCC %in% scc_motor,]
motordata$year <- as.factor(motordata$year)

plot5 <- ggplot(data = motordata, aes(x=year, y=Emissions))
plot5 + geom_boxplot() + 
        scale_y_log10() +
        ggtitle('PM2.5 Emissions from Motor Vehicle Sources in Baltimore City') +
        ylab('PM2.5 Emission in Tons') +
        xlab('Year')

# Save plot at png file
ggsave(file='Plot5.png', width = 6.4, height = 6.4, unit = 'in')


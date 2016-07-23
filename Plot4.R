# Plot 4: Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

library(ggplot2)

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Finding all sources that contain the word 'coal' 
find_coal_sources <- grep(pattern = '.*coal.*', x = SCC$SCC.Level.Three, ignore.case = TRUE)
find_coal_sources

# All SCC numbers for the sources that contain the word 'coal'
scc_coal <- SCC[find_coal_sources,'SCC']

# Subsetting the NEI Data Set 
coaldata <- NEI[NEI$SCC %in% scc_coal,]
coaldata$year <- as.factor(coaldata$year)

plot4 <- ggplot(data = coaldata, aes(x=year, y=Emissions))
plot4 + geom_boxplot() + 
        scale_y_log10() +
        ggtitle('PM2.5 Emissions from Coal combustion-related Sources') +
        ylab('PM2.5 Emission in Tons') +
        xlab('Year')

# Save plot at png file
ggsave(file='Plot4.png', width = 6.4, height = 6.4, unit = 'in')



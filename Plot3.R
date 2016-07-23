# Plot3: 
# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variab
# le, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
# answer this question.

library(ggplot2)

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsetting data frame to include only the data from Baltimore City
baltimore <- NEI[NEI$fips == "24510",]
baltimore$type <- as.factor(baltimore$type)
baltimore$year <- as.factor(baltimore$year)

plot3 <- ggplot(data = baltimore, aes(x=year, y=Emissions))
plot3 + geom_boxplot() + facet_grid(type~., scales = 'free') + 
        scale_y_log10() + 
        ggtitle('PM2.5 Emissions in Baltimore City by Type') +
        ylab('PM2.5 Emission in Tons') +
        xlab('Year')

# Save plot at png file
ggsave(file='Plot1.pn3', width = 6.4, height = 6.4, unit = 'in')


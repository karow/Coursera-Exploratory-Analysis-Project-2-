# Plot 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater
# changes over time in motor vehicle emissions?

library(ggplot2)

# Import Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Finding all sources that contain the word 'motor' 
find_motor_vehicle <- grep(pattern = '.*motor*', x = SCC$SCC.Level.Three, ignore.case = TRUE, value = F)

# All SCC numbers for the sources that contain the word 'motor'
scc_motor <- SCC[find_motor_vehicle,'SCC']

# Subsetting the NEI Data Set 
motordata_BC_CA<- NEI[NEI$fips == "24510" | NEI$fips == '06037' & NEI$SCC %in% scc_motor,]

motordata_BC_CA$year <- as.factor(motordata_BC_CA$year)
motordata_BC_CA$fips <- as.factor(motordata_BC_CA$fips)
levels(motordata_BC_CA$fips) <- c('Los Angeles', 'Baltimore City')

plot6 <- ggplot(data = motordata_BC_CA, aes(x=year, y=Emissions))
plot6 + geom_boxplot() + facet_grid(fips~.) +
        scale_y_log10() +
        ggtitle('PM2.5 Emissions from Motor Vehicle Sources') +
        ylab('PM2.5 Emission in Tons') +
        xlab('Year')

# Save plot at png file
ggsave(file='Plot6.png', width = 6.4, height = 6.4, unit = 'in')



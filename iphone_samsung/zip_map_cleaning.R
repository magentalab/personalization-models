
# Load and fix ZIP-Demo mapping table

library(tidyverse)

zip_map <- read_tsv("zip_demo_mapping.tsv")

zip_map_new <- as.data.frame(zip_map$zip)
colnames(zip_map_new)[1] <- "zip"


# Density cleaning

zip_map_new$density <- 0

zip_map_new$density[grep("< 1,500",zip_map$DensityClassRange)] <- 1
zip_map_new$density[grep("1,500 - 3,500",zip_map$DensityClassRange)] <- 2
zip_map_new$density[grep("3,500 - 6,500",zip_map$DensityClassRange)] <- 3
zip_map_new$density[grep("6,500 - 30,000",zip_map$DensityClassRange)] <- 4
zip_map_new$density[grep("30,000 +",zip_map$DensityClassRange)] <- 5


# Income clean

zip_map_new$income <- 0

zip_map_new$income[zip_map$HHIncome_bin == '0-25K'] <- 1
zip_map_new$income[zip_map$HHIncome_bin == '25-50K'] <- 1
zip_map_new$income[zip_map$HHIncome_bin == '50-75K'] <- 2
zip_map_new$income[zip_map$HHIncome_bin == '75-100K'] <- 3
zip_map_new$income[zip_map$HHIncome_bin == '100-125K'] <- 4
zip_map_new$income[zip_map$HHIncome_bin == '125-150K'] <- 5
zip_map_new$income[zip_map$HHIncome_bin == '150-175K'] <- 5
zip_map_new$income[zip_map$HHIncome_bin == '175-200K'] <- 5
zip_map_new$income[zip_map$HHIncome_bin == '200-225K'] <- 5
zip_map_new$income[zip_map$HHIncome_bin == '225-250K'] <- 5
zip_map_new$income[zip_map$HHIncome_bin == '250K+'] <- 5


# Age clean

zip_map_new$age <- 0

zip_map_new$age[zip_map$Age_bin == '18-20'] <- 1
zip_map_new$age[zip_map$Age_bin == '20-25'] <- 1
zip_map_new$age[zip_map$Age_bin == '25-30'] <- 1
zip_map_new$age[zip_map$Age_bin == '30-35'] <- 2
zip_map_new$age[zip_map$Age_bin == '35-40'] <- 3
zip_map_new$age[zip_map$Age_bin == '45-50'] <- 4
zip_map_new$age[zip_map$Age_bin == '50-55'] <- 5
zip_map_new$age[zip_map$Age_bin == '55-60'] <- 5
zip_map_new$age[zip_map$Age_bin == '60-65'] <- 5
zip_map_new$age[zip_map$Age_bin == '65-70'] <- 5
zip_map_new$age[zip_map$Age_bin == '70-75'] <- 5

# Save CSV copy
write_csv(zip_map_new,"./iphone_samsung/zip_map201803.csv")

# merge back into zip_map

zip_map <- zip_map_new



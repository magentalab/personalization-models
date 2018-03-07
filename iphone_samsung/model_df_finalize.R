# Post-query data frame merging and cleaning 

# Merge ZIP Geo data with sitecat query data
df_cartadd_merged <- merge(df_cartadd,zipmap)
df_cartadd <- df_cartadd_merged

# Remove problematic blank mcvisid's
df_cartadd <- df_cartadd[df_cartadd$mcvisid>0,]

# Replace 3's in paid channel (query error)
df_cartadd$channel_paid[df_cartadd$channel_paid==3] <- 1




df_cartadd$vis_num[df_cartadd$vis_num>5] <- 5

df_iphone <- df_cartadd[,-c(1,2,15,17)]
df_samsung <- df_cartadd[,-c(1,2,15,16)]



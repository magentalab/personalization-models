# Post-query data frame merging and cleaning 


# Merge ZIP Geo data with sitecat query data
df_cartadd_merged <- merge(df_cartadd,zipmap)
df_cartadd <- df_cartadd_merged

# Remove problematic blank mcvisid's
df_cartadd <- df_cartadd[df_cartadd$mcvisid>0,]


# Set max visit number at five
df_cartadd$vis_num[df_cartadd$vis_num>5] <- 5

# Separate df into two model df's
df_iphone <- df_cartadd[,-c(1,2,15,17,18)]
df_samsung <- df_cartadd[,-c(1,2,15,16,18)]


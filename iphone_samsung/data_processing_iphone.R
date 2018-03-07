

# Pre processing data with caret package, feature trimming

library(caret)

nzv <- nearZeroVar(df_iphone, saveMetrics = T)

set.seed(233)

trainIndex_i <- createDataPartition(df_iphone$iphone_cart,p=0.8,list = F,times = 1)
set.seed(833)
trainIndex_s <- createDataPartition(df_samsung$galaxy_cart,p=0.8,list = F,times = 1)

dfi_train <- df_iphone[trainIndex,]
dfi_test <- df_iphone[-trainIndex,]

dfs_train <- df_samsung[trainIndex_s,]
dfs_test <- df_samsung[-trainIndex_s,]


# Train models

iphone_model_1 <- glm(iphone_cart ~ .,family = binomial(link = "logit"),data=dfi_train)
summary(iphone_model_1)

samsung_model_1 <- glm(galaxy_cart ~ .,family = binomial(link = "logit"),data=dfs_train)
summary(samsung_model_1)







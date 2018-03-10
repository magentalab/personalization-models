

# Pre processing data with caret package, feature trimming

library(caret)

nzv <- nearZeroVar(df_iphone_0307, saveMetrics = T)

set.seed(233)

trainIndex_i <- createDataPartition(df_iphone$iphone_cart,p=0.8,list = F,times = 1)
set.seed(833)
trainIndex_s <- createDataPartition(df_samsung$galaxy_cart,p=0.8,list = F,times = 1)

dfip_train <- df_iphone[trainIndex_i,]
dfip_test <- df_iphone[-trainIndex_i,]

dfsp_train <- df_samsung[trainIndex_s,]
dfsp_test <- df_samsung[-trainIndex_s,]


# Train models

iphone_model_03p <- glm(iphone_cart ~ .,family = binomial(link = "logit"),data=dfip_train)
summary(iphone_model_03p)

samsung_model_03p <- glm(galaxy_cart ~ .,family = binomial(link = "logit"),data=dfsp_train)
summary(samsung_model_03p)







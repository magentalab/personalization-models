
# Evaluating iphone + samsung models on test dataset

# iPhone prediction score
dfi_test$pred1 <- predict(iphone_model_1,dfi_test,type = 'response')

dfs4_test$pred1 <- predict(samsung_model_03,dfs4_test,type = 'response')


binary_eval(dfi_test$pred1,dfi_test$iphone_cart)
binary_eval(dfs4_test$pred1,dfs4_test$galaxy_cart)

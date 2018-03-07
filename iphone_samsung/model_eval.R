
# Evaluating iphone + samsung models on test dataset

# iPhone prediction score
dfi_test$pred1 <- predict(iphone_model_1,dfi_test,type = 'response')


binary_eval(dfi_test$pred1,dfi_test$iphone_cart)
binary_eval(dfs_test$pred1,dfs_test$galaxy_cart,cutoff = 0.22)

library(dplyr)
library(scales)
options(scipen = 999)
## set functions
read.excel <- function() {
  x <- read.table("clipboard",sep="\t",header=FALSE, stringsAsFactors = FALSE)
  x <- data.frame(lapply(x, function(y)as.numeric(gsub(",","",y))))
  return(x)
}

confidence <- function(x){
  tval <- 1.96
  vsa <- x$V1[1]
  cva <- x$V2[1]
  cra <- cva/vsa
  stdva <- sqrt(cra*(1-cra))
  sea <- stdva/sqrt(vsa)
  crconfrangea <- tval*(stdva/sqrt(vsa))
  lowa <- cra-crconfrangea
  higha <- cra+crconfrangea
  vsb <- x$V1[2]
  cvb <- x$V2[2]
  crb <- cvb/vsb
  stdvb <- sqrt(crb*(1-crb))
  seb <- stdvb/sqrt(vsb)
  crconfrangeb <- tval*(stdvb/sqrt(vsb))
  lowb <- crb-crconfrangeb
  highb <- crb+crconfrangeb
  #=SQRT(stdevB^2/visitorsB+stdevA^2/visitorsA)
  seddb <- sqrt(stdvb^2/vsb+stdva^2/vsa)
  #=(CR_B-CR_A)/SE_BminusA
  signoiseb <- (crb-cra)/seddb
  #=visitorsA+visitorsB-2
  degfreeb <- vsa+vsb-2
  #=1-T.DIST.2T(ABS(SignalNoiseB),DOF_B)
  confb <- abs(1 - 2*pt(abs(signoiseb),df=degfreeb))
  confb <- confb - (confb %% 0.0001)
  return(confb)
}


results <- function(){
  x <- read.excel()
  
  x <- x %>%
    mutate(Rate = V2/V1) %>%
    mutate(Lift = ((x$V2[2]/x$V1[2])-(x$V2[1]/x$V1[1]))/(x$V2[1]/x$V1[1])) %>%
    mutate(Confidence = confidence(x))
  # 
  x[1,4:5] = ""
  if(x[2,5]==1){
    x[2,5] = .9999
  }
  writeToclipboard(x[,3:5])
}


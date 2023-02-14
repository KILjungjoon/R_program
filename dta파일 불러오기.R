setwd("F:/R project/R study/r_grammar")

## 패키지는 둘 중 하나를 사용하면 된다. 
install.packages("haven")
install.packages("foreign")
library(haven)
library(foreign)

## 파일 불러오기 : dta파일(stata 파일)
dat <- import("Hur_2020_BJPS_KOR.dta")

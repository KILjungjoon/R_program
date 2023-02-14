## 새로운 작업 경로 지정
setwd("F:/R project/R study/r_test/")

## 현재 경로 확인
getwd()

## 파일 loading 패키기, 라이브러리
install.packages("haven")
install.packages("foreign")
library(haven)
library(foreign)

## 파일 불러오기 : dta파일(stata 파일)
dat <- import("Hur_2020_BJPS_KOR.dta")    # 오른쪽 창에 데이터구조가 나타난다.

## 파일 요약 통계
summary(dat1)

## 산점도 plot
plot(wt~agesq, data=dat1)  # 선형적 관계를 관찰하기 어렵다.

# 변수(객체)를 모두 삭제
rm(list=ls())    # ls()는 변수 목록 반환 함수

# 단순선형회귀
m1 <- lm(dutyvote ~ nationpride*partystrength + collective + trustpeople + electint + age + agesq + educ + factor(party),
         , data=dat)  # 변수factor(party): party는 범주형
summary(m1)

# 로지스틱회귀
#logit  [pweight=wt]

m2 <- glm(dutyvote ~ nationpride*partystrength + collective + trustpeople + electint + age + agesq + educ + factor(party),
          family=binomial(), data=dat1)  # logit은 항상 family=binomial()를 사용
summary(m2)

# 통계결과를 깔끔하게 정리 stargazer
library(stargazer)
stargazer(m1,m2,type="text")

# 선형모델의 시각화 visreg
p_load(visreg)       # 패키지 visreg 로딩. pacman 먼저 설치
visreg(m1, xvar="agesq")

m1b <- glm(dutyvote ~ nationpride*partystrength + collective + trustpeople + electint + age + I(age^2) + educ + factor(party),
           family=binomial(), data=dat1)     # I()는 age변수를 활용하여 새로운 값을 생성
visreg(m1b, xvar="age")


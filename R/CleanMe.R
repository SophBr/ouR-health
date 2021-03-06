CleanMe <- function(BRFSS_a) {

  #trans
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "2"] <- 1
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "3"] <- 1
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "4"] <- 0
  
  #GUNNNNSSSS
  BRFSS_a$FIREARM4[BRFSS_a$FIREARM4 == "2"] <- 0
  
  #vet
  BRFSS_a$VETERAN3[BRFSS_a$VETERAN3 == "2"] <- 0
  
  
  BRFSS_a$NOBCUSE6[BRFSS_a$NOBCUSE6 == "19"] <- NA
  BRFSS_a$NOBCUSE6[BRFSS_a$NOBCUSE6 == "77"] <- NA
  BRFSS_a$NOBCUSE6[BRFSS_a$NOBCUSE6 == "99"] <- NA
  
  BRFSS_a$USEMRJN1[BRFSS_a$USEMRJN1 == "7"] <- NA
  BRFSS_a$USEMRJN1[BRFSS_a$USEMRJN1 == "9"] <- NA
  
  BRFSS_a$EMTSUPRT[BRFSS_a$EMTSUPRT == "7"] <- NA
  BRFSS_a$EMTSUPRT[BRFSS_a$EMTSUPRT == "9"] <- NA
  
  BRFSS_a$X_AGEG5YR[BRFSS_a$X_AGEG5YR == "14"] <- NA
  
  BRFSS_a$X_EDUCAG[BRFSS_a$X_EDUCAG == "9"] <- NA
  
  BRFSS_a$X_INCOMG[BRFSS_a$X_INCOMG == "9"] <- NA
  
  BRFSS_a$X_SMOKER3[BRFSS_a$X_SMOKER3 == "9"] <- NA
  
  BRFSS_a$SDHMONEY[BRFSS_a$SDHMONEY == "7"] <- NA
  BRFSS_a$SDHMONEY[BRFSS_a$SDHMONEY == "9"] <- NA
  
  BRFSS_a$SDHSTRES[BRFSS_a$SDHSTRES == "7"] <- NA
  BRFSS_a$SDHSTRES[BRFSS_a$SDHSTRES == "9"] <- NA
  
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "4"] <- NA
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "7"] <- NA
  BRFSS_a$TRNSGNDR[BRFSS_a$TRNSGNDR == "9"] <- NA
  
  
  BRFSS_a$INCOME2[BRFSS_a$INCOME2 == "9"] <- NA
  
  BRFSS_a$FRENCHF1[BRFSS_a$FRENCHF1 == "999"] <- NA
  BRFSS_a$FRENCHF1[BRFSS_a$FRENCHF1 == "777"] <- NA
  
  BRFSS_a$TYPCNTR7[BRFSS_a$TYPCNTR7 == "18"] <- NA
  BRFSS_a$TYPCNTR7[BRFSS_a$TYPCNTR7 == "77"] <- NA
  BRFSS_a$TYPCNTR7[BRFSS_a$TYPCNTR7 == "99"] <- NA
  
  BRFSS_a$FIREARM4[BRFSS_a$FIREARM4 == "9"] <- NA
  BRFSS_a$FIREARM4[BRFSS_a$FIREARM4 == "7"] <- NA
  
  BRFSS_a$SLEPTIM1[BRFSS_a$SLEPTIM1 == "77"] <- NA
  BRFSS_a$SLEPTIM1[BRFSS_a$SLEPTIM1 == "99"] <- NA
  
  BRFSS_a$SEX[BRFSS_a$SEX == "1"] <- "Male"
  BRFSS_a$SEX[BRFSS_a$SEX == "2"] <- "Female"
  
  summary(BRFSS_a$SEX)
  NewData<-BRFSS_a
  NewData<-filter(BRFSS_a,SEX!=9)
  
  NewData
}

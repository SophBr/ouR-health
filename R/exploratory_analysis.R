proper.sleep <- BRFSS %>% filter(SLEPTIM1 <= 24)
hist(proper.sleep$SLEPTIM1)

model <- lm(GENHLTH ~ SLEPTIM1, data = BRFSS)
summary(model)
qplot(SLEPTIM1, GENHLTH, data = proper.sleep)

qplot(FRUTDA2_, X_BMI5, data = BRFSS)
model <- lm(X_BMI5 ~ SDHSTRES + X_FRUTSU1 + X_VEGESU1 + PA1MIN_, data = BRFSS)
summary(model)


qplot(X_FRUTSU1, X_BMI5, data = BRFSS)
model <- lm(X_BMI5CAT ~ X_FRUTSU1 + X_VEGESU1 + PA1MIN_, data = BRFSS)
summary(model)

model <- lm(PHYSHLTH ~ SDHSTRES + MENTHLTH, data = BRFSS)
summary(model)

model <- lm(ADDEPEV2 ~ SDHSTRES, data = BRFSS %>% filter(ADDEPEV2 <= 2))
summary(model)

model <- lm(ADDEPEV2 ~ X_BMI5, data = BRFSS %>% filter(ADDEPEV2 <= 2))
summary(model)


library(Hmisc)
# Correlation matrixes
cleaned <- BRFSS %>% mutate(SDHSTRES = replace(BRFSS,SDHSTRES ==9, NA))
rcorr(as.matrix(cleaned %>% select(X_BMI5, SDHSTRES, X_FRUTSU1, X_VEGESU1, PA1MIN_)))

rcorr(as.matrix(BRFSS %>% select(SDHSTRES, PHYSHLTH, MENTHLTH)))

rcorr(as.matrix(cleaned %>% select(HAVARTH3, ADDEPEV2, NOBCUSE6, GENHLTH, USEMRJN1, EXRACT11, EXERANY2, X_BMI5, EMTSUPRT, X_AGEG5YR, X_EDUCAG, LSATISFY, EDUCA, X_INCOMG, SDHBILLS, SDHMOVE, X_SMOKER3, HOWSAFE1, SDHFOOD, SDHMEALS, SDHMONEY, SDHSTRES, CHCKIDNY, SXORIENT, TRNSGNDR, PHYSHLTH, MENTHLTH, FIREARM4, DIABETE3, MARITAL, X_CPRACE, X_CRACE1, X_RFHYPE5, X_CHOLCH1, X_RFCHOL1, X_LTASTH1, CHOLCHK1, VETERAN3, INCOME2, X_STATE, BPHIGH4, FRENCHF1, EXRACT21, X_FRUTSU1, X_VEGESU1, X_FRTLT1A, X_VEGLT1A, TYPCNTR7, CAREGIV1, PA1MIN_)))

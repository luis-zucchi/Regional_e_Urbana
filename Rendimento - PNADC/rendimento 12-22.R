install.packages("PNADcIBGE")
library(PNADcIBGE)
library(survey)

setwd("D:\\Pessoal\\Luis_Souza\\Rendimentos\\microdados")

pnad2017 <- read.fwf(file="PNADC_2017_visita1.txt", widths = c(4,7,9,7,15,15,543,8),
                     col.names=c("ano","skip1","UPA","estrato","skip3","peso","skip4","rendimento"))

pnad2017 <- subset(pnad2017, select = c("ano","UPA","estrato","peso","rendimento"))

head(pnad2017,10)

summary(pnad2017$rendimento)

ggplot(pnad2017, aes(rendimento)) + geom_boxplot()

pnad2017_limpa <- na.omit(pnad2017)
summary(pnad2017_limpa$rendimento)

pnad2017d <- svydesign(
  ids = ~ UPA , # Declara a unidade amostral mais granular
  strata = ~ estrato , # Declara a variável que contém os estratos
  weights = ~ peso , # Declara variável com pesos
  data = pnad2017_limpa , # Declara base de microdados
  nest = TRUE # Declara que os estratos podem conter identificações identicas para UPA's distintas
  
)

svymean(~ rendimento, pnad2017d, na.rm = T)

svytotal(~ rendimento, pnad2017d, na.rm = T)





########## PNADcIBGE
pnad2017_on <- get_pnadc(year = 2017, interview = 1)

svytotal(~ VD4046, pnad2017_on, na.rm = T)

pnad2017on <- pnadc_design(pnad2017_on)


##############


#df
#rendimentos <- data.frame(Ano = 2012:2021)


#2012
dadosPNADc_anual_visita <- get_pnadc(year=2012, interview=1)

agregado_por_uf_2012 <- svyby( ~ VD4046 , ~ UF , dadosPNADc_anual_visita , svytotal , na.rm = TRUE )

#totalrenda1 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita, na.rm=TRUE)
#totalrenda1

#rendimentos[1,2] <- #totalrenda1[1]

#2013
dadosPNADc_anual_visita13 <- get_pnadc(year=2013, interview=1)

#totalrenda13 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita13, na.rm=TRUE)
#totalrenda13

#rendimentos[2,2] <- #totalrenda13[1]

#2014
dadosPNADc_anual_visita14 <- get_pnadc(year=2014, interview=1)

#totalrenda14 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita14, na.rm=TRUE)
#totalrenda14

#rendimentos[3,2] <- #totalrenda14[1]

#2015
dadosPNADc_anual_visita15 <- get_pnadc(year=2015, interview=1)

#totalrenda15 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita15, na.rm=TRUE)
#totalrenda15

#rendimentos[4,2] <- #totalrenda15[1]

#2016
dadosPNADc_anual_visita16 <- get_pnadc(year=2016, interview=1)

#totalrenda16 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita16, na.rm=TRUE)
#totalrenda16

#rendimentos[5,2] <- #totalrenda16[1]

#2017
dadosPNADc_anual_visita17 <- get_pnadc(year=2017, interview=1)

#totalrenda17 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita17, na.rm=TRUE)
#totalrenda17

#rendimentos[6,2] <- #totalrenda17[1]

#2018
dadosPNADc_anual_visita18 <- get_pnadc(year=2018, interview=1)

#totalrenda18 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita18, na.rm=TRUE)
#totalrenda18

#rendimentos[7,2] <- #totalrenda18[1]

#2019
dadosPNADc_anual_visita19 <- get_pnadc(year=2019, interview=1)

#totalrenda19 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita19, na.rm=TRUE)
#totalrenda19

#rendimentos[8,2] <- #totalrenda19[1]

#2020
dadosPNADc_anual_visita20 <- get_pnadc(year=2020, interview=5)

#totalrenda20 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita20, na.rm=TRUE)
#totalrenda20

#rendimentos[9,2] <- #totalrenda20[1]

#2021
dadosPNADc_anual_visita21 <- get_pnadc(year=2021, interview=5)

totalrenda21 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita21, na.rm=TRUE)
totalrenda21

#rendimentos[10,2] <- #totalrenda21[1]

#2022
dadosPNADc_anual_visita22 <- get_pnadc(year=2022, interview=5)

totalrenda22 <- svytotal(x=~VD4046, design=dadosPNADc_anual_visita22, na.rm=TRUE)
totalrenda22

#rendimentos[11,2] <- #totalrenda22[1]
#

########################################################################################################



agregado_por_uf_2012 <- svyby( ~ VD4046 , ~ UF , dadosPNADc_anual_visita , svytotal , na.rm = TRUE )
# Para o ano de 2013
agregado_por_uf_2013 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita13, svytotal, na.rm = TRUE)

# Para o ano de 2014
agregado_por_uf_2014 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita14, svytotal, na.rm = TRUE)

# Para o ano de 2015
agregado_por_uf_2015 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita15, svytotal, na.rm = TRUE)

# Para o ano de 2016
agregado_por_uf_2016 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita16, svytotal, na.rm = TRUE)

# Para o ano de 2017
agregado_por_uf_2017 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita17, svytotal, na.rm = TRUE)

# Para o ano de 2018
agregado_por_uf_2018 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita18, svytotal, na.rm = TRUE)

# Para o ano de 2019
agregado_por_uf_2019 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita19, svytotal, na.rm = TRUE)

# Para o ano de 2020
agregado_por_uf_2020 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita20, svytotal, na.rm = TRUE)

# Para o ano de 2021
agregado_por_uf_2021 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita21, svytotal, na.rm = TRUE)

# Para o ano de 2022
agregado_por_uf_2022 <- svyby(~ VD4046, ~ UF, dadosPNADc_anual_visita22, svytotal, na.rm = TRUE)




###################

library(openxlsx)

# Lista de dataframes
dataframes <- list(
  agregado_por_uf_2012,
  agregado_por_uf_2013,
  agregado_por_uf_2014,
  agregado_por_uf_2015,
  agregado_por_uf_2016,
  agregado_por_uf_2017,
  agregado_por_uf_2018,
  agregado_por_uf_2019,
  agregado_por_uf_2020,
  agregado_por_uf_2021,
  agregado_por_uf_2022
)

# Nome de cada guia
sheet_names <- paste(2012:2022)


# Crie um novo arquivo Excel
wb <- createWorkbook()

# Adicione cada dataframe como uma guia separada
for (i in seq_along(dataframes)) {
  addWorksheet(wb, sheetName = sheet_names[i])
  writeData(wb, sheet = i, x = dataframes[[i]])
}

# Salve o arquivo
saveWorkbook(wb, file = "rendimento_por_estado_12-22.xlsx")

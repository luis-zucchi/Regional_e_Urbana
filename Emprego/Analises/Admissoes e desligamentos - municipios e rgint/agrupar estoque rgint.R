library(readxl)
install.packages("dplyr")
library(dplyr)
install.packages("writexl")
library(writexl)

estoque <- read_excel("D:/Pessoal/Luis_Souza/Fase 3/estoque_85-21.xlsx")
View(estoque)

regioes_geograficas_intermediarias <- read_excel("D:/Pessoal/Luis_Souza/Regioes_intermediarias/regioes geograficas intermediarias.xlsx")
View(regioes_geograficas_intermediarias)


# 

regioes_geograficas_intermediarias$Municipio <- substr(regioes_geograficas_intermediarias$CD_GEOCODI, 1, nchar(regioes_geograficas_intermediarias$CD_GEOCODI) -1)



# UNINDO OS DATA FRAMES

df <- merge(regioes_geograficas_intermediarias, estoque, by.x = "Municipio", by.y = "Codigo", all.y = FALSE, all.x = TRUE)

df <- df %>% filter(row_number() != 4921)

df$CD_GEOCODI <- NULL
df$Nom_Municipio <- NULL



for (ano in 1986:2001) {
  coluna_nome <- as.character(ano)
  df[[coluna_nome]] <- as.numeric(df[[coluna_nome]])
}



#teste

arquivo_excel <- "estoque_com_regiao.xlsx"

write_xlsx(df, path = arquivo_excel)


####

dff <- df %>%
  group_by(cod_rgint, nome_rgint) %>%
  summarise(across(where(is.numeric), sum))



arquivo_excel <- "estoque_real_rgint.xlsx"

write_xlsx(dff, path = arquivo_excel)

getwd()








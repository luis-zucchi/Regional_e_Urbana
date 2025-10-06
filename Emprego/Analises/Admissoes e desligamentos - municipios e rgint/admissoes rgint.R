library(readxl)
install.packages("dplyr")
library(dplyr)
install.packages("writexl")
library(writexl)

estoque_de_emprego <- read_excel("D:/Pessoal/Luis_Souza/Fase 3/admissao_completo.xlsx")
View(estoque_de_emprego)

regioes_geograficas_intermediarias <- read_excel("D:/Pessoal/Luis_Souza/Regioes_intermediarias/regioes geograficas intermediarias.xlsx")
View(regioes_geograficas_intermediarias)


# Criar os novos nomes de coluna
anos <- 1985:2021
meses <- 1:12
nomes_colunas <- c("Nom_Municipio", "Municipio")

for (ano in anos) {
  for (mes in meses) {
    nomes_colunas <- c(nomes_colunas, sprintf("%02d/%02d", mes, (ano - 1900) %% 100))
  }
}

# Renomear as colunas do DataFrame
colnames(estoque_de_emprego) <- nomes_colunas

regioes_geograficas_intermediarias$Municipio <- substr(regioes_geograficas_intermediarias$CD_GEOCODI, 1, nchar(regioes_geograficas_intermediarias$CD_GEOCODI) -1)


#tratando colunas que sao chr

# Suponha que você tenha um DataFrame chamado df
# Primeiro, substitua as barras por pontos nos nomes das colunas
colnames(estoque_de_emprego) <- gsub("/", ".", colnames(estoque_de_emprego))

# Especifique a partir de qual coluna você deseja fazer a conversão
col_start <- 3

# Use um loop for para converter as colunas
for (i in col_start:ncol(estoque_de_emprego)) {
  estoque_de_emprego[[i]] <- as.numeric(estoque_de_emprego[[i]])
}


# UNINDO OS DATA FRAMES

df <- merge(regioes_geograficas_intermediarias, estoque_de_emprego, by.x = "Municipio", by.y = "Codigo", all.y = FALSE, all.x = TRUE)

df <- df %>% filter(row_number() != 4921)

df$CD_GEOCODI <- NULL
df$Nom_Municipio <- NULL


####$$########################
arquivo_excel <- "admissoes nao agregada.xlsx"

write_xlsx(df, path = arquivo_excel)

#############################



dff <- df %>%
  group_by(cod_rgint, nome_rgint) %>%
  summarise(across(where(is.numeric), sum))



arquivo_excel <- "admissoes_rgint.xlsx"

write_xlsx(dff, path = arquivo_excel)

getwd()









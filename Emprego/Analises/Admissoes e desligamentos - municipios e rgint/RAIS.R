library(data.table)
library(tidyverse)
library(readxl)
library(openxlsx)
library(writexl)

setwd("D:/Pessoal/Luis_Souza")

dir_bases <- "D:/Bases/MTE/Vinc/arquivos-csv/"
dir_regioes <- "D:/Pessoal/Luis_Souza/Regioes_intermediarias/"
dir_saida <- "D:/Pessoal/Luis_Souza/Resultados/"

if(!dir.exists(dir_saida)) dir.create(dir_saida)

# Listando arquivos CSV da RAIS --------------------------------
arquivos <- list.files(dir_bases, pattern = "2014|2018")
arquivos <- arquivos[order(as.numeric(str_extract(arquivos, "[[:digit:]]+")))]
anos <- unique(str_extract(arquivos, "[[:digit:]]+"))
caminhos <- paste0(dir_bases, arquivos)

# Carregando skills por CBO ------------------------------------
skills_cbo <- setDT(read_xlsx("D:/Pessoal/Luis_Souza/skills_cbo.xlsx"))

# Regiões intermediárias ---------------------------------------
regioes_inter <- read_excel(file.path(dir_regioes, "regioes geograficas intermediarias.xlsx"))
regioes_inter$Municipio <- substr(regioes_inter$CD_GEOCODI, 1, nchar(regioes_inter$CD_GEOCODI)-1)

# 1. ESTOQUE DE EMPREGO
# ==============================================================

estoque <- read_excel("D:/Pessoal/Luis_Souza/Fase 3/estoque_85-21.xlsx")

estoque_merge <- merge(regioes_inter, estoque, by.x = "Municipio", by.y = "Codigo", all.y = FALSE, all.x = TRUE)

# Remoções / ajustes
estoque_merge <- estoque_merge %>% filter(row_number() != 4921)
estoque_merge$CD_GEOCODI <- NULL
estoque_merge$Nom_Municipio <- NULL

# Forçar colunas numéricas em anos antigos
for (ano in 1986:2001) {
  estoque_merge[[as.character(ano)]] <- as.numeric(estoque_merge[[as.character(ano)]])
}

# Exporta não agregado
write_xlsx(estoque_merge, path = file.path(dir_saida, "estoque_com_regiao.xlsx"))

# Agregado por região intermediária
estoque_rgint <- estoque_merge %>%
  group_by(cod_rgint, nome_rgint) %>%
  summarise(across(where(is.numeric), sum), .groups = "drop")

write_xlsx(estoque_rgint, path = file.path(dir_saida, "estoque_real_rgint.xlsx"))

# 2. FLUXO DE EMPREGO
# ==============================================================

fluxo <- read_excel("D:/Pessoal/Luis_Souza/Emprego RAIS/Fase 6/fluxo.xlsx")

# Renomeando colunas (ano/mês)
nomes_fluxo <- c("Codigo","Municipio",
                 # nomes até 2021
                 unlist(lapply(2003:2021, function(a) {
                   c(sprintf("%02d/%02d", 1:12, (a-2000)), paste0("total/", a))
                 }))
)
colnames(fluxo) <- nomes_fluxo

# Limpando linhas ruins
fluxo <- fluxo[-c(5185,4947,4627,4525,229), ]
indices_ignorar <- c(5655,6554,5653,5651,5344,5202,5123,4625,4331,3931,3285,3192,3113,
                     2259,1841,1765,1662,1476,1252,1084,899,674,456,316,299,155,139,76,53)
fluxo <- fluxo[-indices_ignorar, ]
rownames(fluxo) <- NULL

fluxo_merge <- merge(regioes_inter, fluxo, by.x = "Municipio", by.y = "Codigo", all.y = FALSE, all.x = TRUE)

fluxo_merge <- fluxo_merge %>% filter(row_number() != 4921)
fluxo_merge$CD_GEOCODI <- NULL
fluxo_merge$Nom_Municipio <- NULL

# Exporta não agregado
write_xlsx(fluxo_merge, path = file.path(dir_saida, "fluxo_nao_agregado.xlsx"))

# Agregado por região intermediária
fluxo_rgint <- fluxo_merge %>%
  group_by(cod_rgint, nome_rgint) %>%
  summarise(across(where(is.numeric), sum), .groups = "drop")

write_xlsx(fluxo_rgint, path = file.path(dir_saida, "fluxo_rgint.xlsx"))

# 3. DESLIGAMENTOS
# ==============================================================

deslig <- read_excel("D:/Pessoal/Luis_Souza/Fase 3/Desligamentos.xlsx")

# Renomear colunas
anos <- 1985:2021
meses <- 1:12
nomes_deslig <- c("Nom_Municipio","Municipio")
for (a in anos) {
  for (m in meses) {
    nomes_deslig <- c(nomes_deslig, sprintf("%02d/%02d", m, (a-1900) %% 100))
  }
}
colnames(deslig) <- nomes_deslig

# Ajuste nomes (substituir "/" por ".")
colnames(deslig) <- gsub("/", ".", colnames(deslig))

# Converter colunas numéricas
for (i in 3:ncol(deslig)) {
  deslig[[i]] <- as.numeric(deslig[[i]])
}

# Merge
deslig_merge <- merge(regioes_inter, deslig, by.x = "Municipio", by.y = "Municipio", all.y = FALSE, all.x = TRUE)
deslig_merge <- deslig_merge %>% filter(row_number() != 4921)
deslig_merge$CD_GEOCODI <- NULL
deslig_merge$Nom_Municipio <- NULL

# Exporta não agregado
write_xlsx(deslig_merge, path = file.path(dir_saida, "desligamentos_nao_agregado.xlsx"))

# Agregado por região intermediária
deslig_rgint <- deslig_merge %>%
  group_by(cod_rgint, nome_rgint) %>%
  summarise(across(where(is.numeric), sum), .groups = "drop")

write_xlsx(deslig_rgint, path = file.path(dir_saida, "desligamentos_rgint.xlsx"))

getwd()
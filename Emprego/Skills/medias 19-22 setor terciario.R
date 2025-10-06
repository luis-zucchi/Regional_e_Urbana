library(haven)
library(data.table)
library(tidyverse)
library(readxl)


lista_dados <- list()

for (i in seq_along(caminhos_19_22)) {
  
  ano <- str_extract(caminhos_19_22[i], pattern = "[[:digit:]]+")

if (ano %in% c(2019:2022)) {
  
  print(ano)
  
  
  print(caminhos_19_22[i])
  
  dados <- fread(caminhos_19_22[i],
                 select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
    .[naturjur>2020 & empem3112==1 &  (clascnae95>=50000 & clascnae95<75000 | clascnae95>= 80000 & clascnae95 < 95000 | clascnae95 >=99000)] %>%
    .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
    .[, cbo2002 := as.numeric(ocup2002)] %>%
    merge(skills_cbo, by = "cbo2002")%>%
    .[!is.na(ncognitivo)]
  
  dados <- dados[, .(media_ncognitivo = mean(ncognitivo, na.rm = TRUE),
                     media_nsocial = mean(nsocial, na.rm = TRUE),
                     media_nmotor = mean(nmotor, na.rm = TRUE),
                     media_nmed = mean(nmed, na.rm = TRUE)), 
                 by = municipio]
  
  # Mantendo apenas a primeira observação para cada municipio
  dados <- dados[order(municipio)][, .SD[1], by = municipio]
  
  # Selecionando as colunas finais
  dados <- dados[, .(municipio, media_ncognitivo, media_nsocial, media_nmotor, media_nmed)]
  
  lista_dados[[i]] <- dados
  
  gc()
  
}
}










# Número de dataframes na lista
num_dfs <- length(lista_dados)

# Determinando o número de grupos com base no intervalo de 16
num_grupos <- 16

# Inicializando uma lista para armazenar os dataframes resultantes
result <- vector("list", num_grupos)

# Loop para agregar os dataframes de acordo com o padrão especificado
for (i in 1:num_grupos) {
  indices <- seq(i, num_dfs, by = num_grupos)
  
  # Extraindo e combinando os dataframes selecionados na lista
  result[[i]] <- do.call(rbind, lista_dados[indices])
}

# Nomeando cada dataframe na lista resultante para facilitar a visualização
names(result) <- paste0("df_", seq_along(result))

# Exibindo os dataframes resultantes
result








# Exportando os data frames para Excel
# Defina o caminho onde deseja salvar o arquivo Excel
caminho_excel <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/medias.xlsx"

# Escreva cada data frame da lista para uma planilha separada no arquivo Excel
wb <- createWorkbook()
for (i in seq_along(result)) {
  addWorksheet(wb, sheetName = paste0("media_terciario_", i))
  writeData(wb, sheet = i, x = result[[i]])
}
saveWorkbook(wb, caminho_excel, overwrite = TRUE)

# Mensagem de confirmação
cat("Dados exportados para", caminho_excel, "\n") 










diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/terciario/"


min_length <- min(length(result), length(ano))


for (i in seq_len(min_length)){
  gc()
  
  # Renomear as colunas
  colnames(result[[i]]) <- c("municipio", paste0("cog",ano[i]),paste0("soc",ano[i]),paste0("mot",ano[i]),paste0("med",ano[i]))
  
  
  arq_cog <- paste0("cog_", ano[i])
  
  segunda_coluna <- select(result[[i]], 1:2)  # Aqui assumindo que sempre queremos a segunda coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_cog <- segunda_coluna
  }
  else {
    path_cog <- merge(path_cog, segunda_coluna, by="municipio", all=TRUE)
  }
  
  cog <- assign(arq_cog, path_cog)
  
  
  
  ##########
  
  
  arq_soc <- paste0("soc_", ano[i])
  
  terceira_coluna <- select(result[[i]], 1,3)  # Aqui assumindo que sempre queremos a terceira coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_soc <- terceira_coluna
  }
  else {
    path_soc <- merge(path_soc, terceira_coluna, by="municipio", all=TRUE)
  }
  
  soc <- assign(arq_soc, path_soc)
  

  
  #############
  
  
  arq_mot <- paste0("mot_", ano[i])
  
  quarta_coluna <- select(result[[i]], 1,4)  # Aqui assumindo que sempre queremos a quarta coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_mot <- quarta_coluna
  }
  else {
    path_mot <- merge(path_mot, quarta_coluna, by="municipio", all=TRUE)
  }
  
  mot <- assign(arq_mot, path_mot)
  

  
  
  
  ###############
  
  arq_med <- paste0("med_", ano[i])
  
  quinta_coluna <- select(result[[i]], 1,5)  # Aqui assumindo que sempre queremos a quinta coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_med <- quinta_coluna
  }
  else {
    path_med <- merge(path_med, quinta_coluna, by="municipio", all=TRUE)
  }
  
  med <- assign(arq_med, path_med)
  
  

}



for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, jota, ".xlsx")
  write_xlsx(get(jota), path=dire)
}



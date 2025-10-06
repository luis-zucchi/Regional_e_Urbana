################################## MEDIA TODOS OS SETORES

library(haven)
library(data.table)
library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)

arquivos_19_22 <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "2019|2020|2021|2022")
arquivos_19_22


caminhos_19_22 <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos_19_22)
caminhos_19_22

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))


lista_dados_todos <- list()

for (i in seq_along(caminhos_19_22)) {
  
  ano <- str_extract(caminhos_19_22[i], pattern = "[[:digit:]]+")
  
  if (ano %in% c(2019:2022)) {
    
    print(ano)
    
    print(caminhos_19_22[i])
    
    dados <- fread(caminhos_19_22[i],
                   select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
      .[naturjur>2020 & as.numeric(empem3112)==1] %>%
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
    
    lista_dados_todos[[i]] <- dados
    
    gc()
  }
}

# agrupar grandes regioes por ano

# Número de dataframes na lista
num_dfs <- length(lista_dados_todos)

# Determinando o número de grupos com base no intervalo de 4
num_grupos <- 4

# Inicializando uma lista para armazenar os dataframes resultantes
result_todos <- vector("list", num_grupos)

# Loop para agregar os dataframes de acordo com o padrão especificado
for (i in 1:num_grupos) {
  indices <- seq(i, num_dfs, by = num_grupos)
  
  # Extraindo e combinando os dataframes selecionados na lista
  result_todos[[i]] <- do.call(rbind, lista_dados_todos[indices])
}

# Nomeando cada dataframe na lista resultante para facilitar a visualização
names(result_todos) <- paste0("df_", seq_along(result_todos))

#gerar excel com todas, por ano

# Exportando os data frames para Excel
# Defina o caminho onde deseja salvar o arquivo Excel
caminho_excel <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/todos os setores/medias todos os setores.xlsx"

# Escreva cada data frame da lista para uma planilha separada no arquivo Excel
wb <- createWorkbook()
for (i in seq_along(result_todos)) {
  addWorksheet(wb, sheetName = paste0("media_terciario_", i))
  writeData(wb, sheet = i, x = result_todos[[i]])
}
saveWorkbook(wb, caminho_excel, overwrite = TRUE)

# Mensagem de confirmação
cat("Dados exportados para", caminho_excel, "\n")

# dividir cada skill em uma planilha

diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/todos os setores/"

diretorio

ano <- 19:22
min_length <- min(length(result_todos), length(ano))


for (i in seq_len(min_length)){
  
  # Renomear as colunas
  colnames(result_todos[[i]]) <- c("municipio", paste0("cog",ano[i]),paste0("soc",ano[i]),paste0("mot",ano[i]),paste0("med",ano[i]))
  
  
  arq_cog <- paste0("cog_", ano[i])
  
  segunda_coluna <- select(result_todos[[i]], 1:2)  # Aqui assumindo que sempre queremos a segunda coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_cog <- segunda_coluna
  }
  else {
    path_cog <- merge(path_cog, segunda_coluna, by="municipio", all=TRUE)
  }
  
  cog <- assign(arq_cog, path_cog)
  
  write.xlsx(cog, file = paste0(diretorio,arq_cog, ".xlsx"))
  
  ##########
  
  arq_soc <- paste0("soc_", ano[i])
  
  terceira_coluna <- select(result_todos[[i]], 1,3)  # Aqui assumindo que sempre queremos a terceira coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_soc <- terceira_coluna
  }
  else {
    path_soc <- merge(path_soc, terceira_coluna, by="municipio", all=TRUE)
  }
  
  soc <- assign(arq_soc, path_soc)
  
  write.xlsx(soc, file = paste0(diretorio,arq_soc, ".xlsx"))
  
  
  #############
  
  
  arq_mot <- paste0("mot_", ano[i])
  
  quarta_coluna <- select(result_todos[[i]], 1,4)  # Aqui assumindo que sempre queremos a quarta coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_mot <- quarta_coluna
  }
  else {
    path_mot <- merge(path_mot, quarta_coluna, by="municipio", all=TRUE)
  }
  
  mot <- assign(arq_mot, path_mot)
  
  write.xlsx(mot, file = paste0(diretorio,arq_mot, ".xlsx"))
  
  ###############
  
  arq_med <- paste0("med_", ano[i])
  
  quinta_coluna <- select(result_todos[[i]], 1,5)  # Aqui assumindo que sempre queremos a quinta coluna
  
  # Combina as colunas em um novo data frame
  if (i == 1) {
    path_med <- quinta_coluna
  }
  else {
    path_med <- merge(path_med, quinta_coluna, by="municipio", all=TRUE)
  }
  
  med <- assign(arq_med, path_med)
  
  
  write.xlsx(med, file = paste0(diretorio,arq_med, ".xlsx"))
  
}

for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, jota, ".xlsx")
  write_xlsx(get(jota), path=dire)
}

gc()

################################## MEDIA TODOS OS SETORES DECIS


# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))

# Carregando o arquivo de microrregiÃÂµes


lista_regioes_todos <- list()



for (i in seq_along(caminhos_19_22)) {
  
  ano <- str_extract(caminhos_19_22[i], pattern = "[[:digit:]]+")
  
  if (ano %in% c(2019:2022)) {
    
    print(ano)
    
    print(caminhos_19_22[i])
    
    dados <- fread(caminhos_19_22[i],
                   select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
      .[naturjur>2020 & empem3112==1] %>%
      .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
      .[, cbo2002 := as.numeric(ocup2002)] %>%
      merge(skills_cbo, by = "cbo2002")%>%
      .[!is.na(ncognitivo)] %>%
      .[,c("municipio", "ncognitivo",  "nsocial",     "nmotor",      "nmed")]
    
    
    lista_regioes_todos[[i]] <- dados
    
    gc()
  }
}

# agrupar grandes regioes por ano


# Número de dataframes na lista
num_dfs <- length(lista_regioes_todos)

# Determinando o número de grupos com base no intervalo de 4
num_grupos <- 4

# Inicializando uma lista para armazenar os dataframes resultantes
result_decis_todos <- vector("list", num_grupos)

# Loop para agregar os dataframes de acordo com o padrão especificado
for (i in 1:num_grupos) {
  indices <- seq(i, num_dfs, by = num_grupos)
  
  # Extraindo e combinando os dataframes selecionados na lista
  result_decis_todos[[i]] <- do.call(rbind, lista_regioes_todos[indices])
}

# Nomeando cada dataframe na lista resultante para facilitar a visualização
names(result_decis_todos) <- paste0("df_", seq_along(result_decis_todos))



lista_final_todos <- list()
lista_decis_skills_todos <- list()
lista_decis_sofst_todos <- list()




for(i in 1:4){
  for(decilo in 1:11){
    
    lista_decis_skills_todos[[decilo]] <- merge(lista_decis[[decilo]],result_decis_todos[[i]], by.x= "codigo", by.y = "municipio")
    
    setDT(lista_decis_skills_todos[[decilo]])
    
    lista_decis_sofst_todos[[decilo]] <- lista_decis_skills_todos[[decilo]][, .(media_ncognitivo = mean(ncognitivo, na.rm = TRUE),
                                                                                media_nsocial = mean(nsocial, na.rm = TRUE),
                                                                                media_nmotor = mean(nmotor, na.rm = TRUE),
                                                                                media_nmed = mean(nmed, na.rm = TRUE))]
    gc()
  }
  lista_final_todos[[i]] <- lista_decis_sofst_todos
  gc()
}








Decil <-1:11

tipos <- c("cog", "soc", "mot", "med")

for(catg in 1:4){
  
  for(j in 1:4){
    
    plana <- lista_final_todos[[j]]
    
    for(i in 1:11){
      if(i == 1){
        stitch <- select(plana[[1]],catg)
      }
      else{
        stitch <- rbind(stitch, select(plana[[i]],catg))
      }
    }
    
    
    
    if(j == 1){
      finala <- stitch
    }
    else{
      finala <- cbind(finala, stitch)
    }
    
  }
  tipo <- paste0(tipos[catg], "todossetores")
  colnames(finala) <- as.character(2019:2022)
  finala <- cbind(Decil, finala)
  assign(tipo, finala)
  gc()
  
}



diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/todos os setores/decis/"

diretorio


#salvando

for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, getto, ".xlsx")
  getto <- paste0(jota, "todossetores")
  write_xlsx(get(getto), path=dire)
}






gc()



################################## MEDIA TERCIARIO




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

# Determinando o número de grupos com base no intervalo de 4
num_grupos <- 4

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




############ MEDIA TERCIARIO DECIS



lista_regioes <- list()



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
      .[!is.na(ncognitivo)] %>%
      .[,c("municipio", "ncognitivo",  "nsocial",     "nmotor",      "nmed")]
    
    gc()
    lista_regioes[[i]] <- dados
    gc()
  }
  gc()
}




# agrupar grandes regioes por ano


# Número de dataframes na lista
num_dfs <- length(lista_regioes)

# Determinando o número de grupos com base no intervalo de 4
num_grupos <- 4

# Inicializando uma lista para armazenar os dataframes resultantes
result_decis <- vector("list", num_grupos)

# Loop para agregar os dataframes de acordo com o padrão especificado
for (i in 1:num_grupos) {
  indices <- seq(i, num_dfs, by = num_grupos)
  
  # Extraindo e combinando os dataframes selecionados na lista
  result_decis[[i]] <- do.call(rbind, lista_regioes[indices])
}

# Nomeando cada dataframe na lista resultante para facilitar a visualização
names(result_decis) <- paste0("df_", seq_along(result_decis))



lista_final <- list()
lista_decis_skills <- list()
lista_decis_sofst <- list()




for(i in 1:4){
  for(decilo in 1:11){
    
    lista_decis_skills[[decilo]] <- merge(lista_decis[[decilo]],result_decis[[i]], by.x= "codigo", by.y = "municipio")
    
    setDT(lista_decis_skills[[decilo]])
    
    lista_decis_sofst[[decilo]] <- lista_decis_skills[[decilo]][, .(media_ncognitivo = mean(ncognitivo, na.rm = TRUE),
                                                                    media_nsocial = mean(nsocial, na.rm = TRUE),
                                                                    media_nmotor = mean(nmotor, na.rm = TRUE),
                                                                    media_nmed = mean(nmed, na.rm = TRUE))]
  }
  lista_final[[i]] <- lista_decis_sofst
}





###

Decil <-1:11

tipos <- c("cog", "soc", "mot", "med")

for(catg in 1:4){
  
  for(j in 1:4){
    
    plana <- lista_final[[j]]
    
    for(i in 1:11){
      if(i == 1){
        stitch <- select(plana[[1]],catg)
      }
      else{
        stitch <- rbind(stitch, select(plana[[i]],catg))
      }
    }
    
    
    
    if(j == 1){
      finala <- stitch
    }
    else{
      finala <- cbind(finala, stitch)
    }
    
  }
  tipo <- paste0(tipos[catg], "terciario")
  colnames(finala) <- as.character(2019:2022)
  finala <- cbind(Decil, finala)
  assign(tipo, finala)
  
}



diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/todos os setores/decis/"

diretorio


#salvando

for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, getto, ".xlsx")
  getto <- paste0(jota, "terciario")
  write_xlsx(get(getto), path=dire)
}


























##################### RANKING ######################

############ RANKING TODOS


catg <- c("cog","soc","mot","med")


# gerar procentagem de profissoes sofisticadas por municipio, para cada grande regiao


for(categoria in 1:4){
  
  lista_dados_ranking <- list()
  
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names= FALSE)
  
  for (i in seq_along(caminhos_19_22)) {
    
    ano <- str_extract(caminhos_19_22[i], pattern = "[[:digit:]]+")
    
    if (ano %in% c(2019:2022)) {
      
      print(ano)
      
      print(caminhos_19_22[i])
      
      dados <- fread(caminhos_19_22[i],
                     select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
        .[naturjur>2020 & empem3112==1] %>%
        .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
        .[, cbo2002 := as.numeric(ocup2002)] %>%
        merge(skills_cbo, by = "cbo2002", all.x = TRUE) %>%
        .[, matched := !is.na(ncognitivo)]
      
      profissoes <- profissoes_sofisticadas$...1
      
      # Contar o número de indivíduos com profissões sofisticadas por município
      dados <- dados %>%
        mutate(profissao_sofisticada = ocup2002 %in% profissoes) %>%
        group_by(municipio) %>%
        summarise(total_individuos = n(),
                  total_profissoes_sofisticadas = sum(profissao_sofisticada, na.rm = TRUE),
                  proporcao = total_profissoes_sofisticadas / total_individuos)
      
      lista_dados_ranking[[i]] <- dados
    }
    gc()
  }
  tata <- paste0("lista_rank",catg[categoria])
  assign(tata, lista_dados_ranking)
  gc()
}










#####

for(categoria in 1:4){
  
  davez <- paste0("lista_rank",catg[categoria])
  
  lista_ranks_todos <- get(davez)
  
  # agrupar grandes regioes por ano
  
  # Número de dataframes na lista
  num_dfs <- length(lista_ranks_todos)
  
  # Determinando o número de grupos com base no intervalo de 4
  num_grupos <- 4
  
  # Inicializando uma lista para armazenar os dataframes result_rank_rankantes
  result_rank <- vector("list", num_grupos)
  
  # Loop para agregar os dataframes de acordo com o padrão especificado
  for (i in 1:num_grupos) {
    indices <- seq(i, num_dfs, by = num_grupos)
    
    # Extraindo e combinando os dataframes selecionados na lista
    result_rank[[i]] <- do.call(rbind, lista_ranks_todos[indices])
  }
  
  # Nomeando cada dataframe na lista result_rankante para facilitar a visualização
  names(result_rank) <- paste0("df_", seq_along(result_rank))
  
  toto <- paste0(catg[categoria],"result_rank")
  assign(toto, result_rank)
  
}









catg <- c("cog", "soc", "mot", "med")

for(categoria in 1:4){
  
  for(j in 1:4){
    
    nome <- paste0(catg[categoria],"result_rank")
    plana <- get(nome)
    
    if(j == 1){
      stitch <- plana[[1]][,c(1,4)]
    }
    else{
      stitch <- merge(stitch, plana[[j]][,c(1,4)],by = "municipio", all =TRUE)
    }
  }
  
  tipo <- paste0(catg[categoria], "rank") 
  colnames(stitch) <- c("municipio", as.character(2019:2022))
  assign(tipo, stitch)
  
  dire <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/ranking/todos os setores/", catg[categoria]," ranktodos.xlsx")
  write_xlsx(stitch, path=dire)
}




####### RANKING TODOS DECIS



catg <- c("cog","soc","mot","med")

# Anos de interesse
anos_interesse <- 2019:2022

serie_anos <- 1:4


for (categoria in 1:4) {
  listas_anos <- list()
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names = FALSE)
  
  # Loop sobre os anos
  for (ano in serie_anos) {
    # Convertendo ano para o formato de dois dígitos
    ano_str <- sprintf("%02d", anos_interesse[ano] %% 100)
    
    # Loop sobre os arquivos
    for (arquivo in seq_along(caminhos_19_22)) {
      # Extrai o ano do arquivo
      ano_arquivo <- str_extract(arquivos[arquivo], pattern = "[[:digit:]]{4}")
      
      # Verifica se o ano do arquivo corresponde ao ano atual do loop
      if (ano_arquivo == as.character(anos_interesse[ano])) {
        
        
        lista_rank_decis <- list()
        prop_lista <- list()
        
        print(ano_str)
        print(caminhos_19_22[arquivo])
        
        dados <- fread(caminhos_19_22[arquivo],
                       select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
          .[naturjur > 2020 & empem3112 == 1] %>%
          .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
          .[, cbo2002 := as.numeric(ocup2002)] %>%
          merge(skills_cbo, by = "cbo2002", all.x = TRUE) %>%
          .[, matched := !is.na(ncognitivo)]
        
        profissoes <- profissoes_sofisticadas$...1
        
        # Contar o número de indivíduos com profissões sofisticadas por município
        dados <- dados %>%
          mutate(profissao_sofisticada = ocup2002 %in% profissoes) %>%
          group_by(municipio) %>%
          summarise(total_individuos = n(),
                    total_profissoes_sofisticadas = sum(profissao_sofisticada, na.rm = TRUE))
        
        for (decil in 1:11) {
          lista_rank_decis[[decil]] <- dados %>%
            filter(municipio %in% lista_decis[[decil]])
        }
        
        for (decil in 1:11){
          total_profis_decis <- sum(lista_rank_decis[[decil]][["total_individuos"]])
          
          soft_profis_decis <- sum(lista_rank_decis[[decil]][["total_profissoes_sofisticadas"]])
          
          prop_lista[decil] <- soft_profis_decis/total_profis_decis
        }
        
        
        titi <- paste0(ano_str, "_lista_props")
        assign(titi, prop_lista, envir = .GlobalEnv)
        
        listas_anos[[ano]] <- get(titi)
        
        gc()
      }
    }
  }
  
  tata <- paste0(catg[categoria], "_lista_ranking_decis")
  assign(tata, listas_anos, envir = .GlobalEnv)
  gc()
}



#salvando



Decil <-1:11

tipos <- c("cog", "soc", "mot", "med")

for(catg in 1:4){
  pla <- paste0(tipos[catg],"_lista_ranking_decis")
  plana <- get(pla)
  
  for(j in 1:4){
    
    for(i in 1:11){
      if(i == 1){
        stitch <- plana[[j]][[1]]
      }
      else{
        stitch <- rbind(stitch, plana[[j]][[i]])
      }
    }
    
    
    if(j == 1){
      finala <- stitch
    }
    else{
      finala <- cbind(finala, stitch)
    }
    
  }
  tipo <- paste0(tipos[catg], "final_rank_decis")
  colnames(finala) <- as.character(2019:2022)
  finala <- cbind(Decil, finala)
  assign(tipo, finala)
  
}


diretorio <- "D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\19-22\\ranking\\todos os setores\\decis\\"



for (jota in c("cog", "soc", "mot", "med")) {
  getto <- paste0(jota, "final_rank_decis")
  dire <- paste0(diretorio, getto, ".xlsx")
  write_xlsx(as.data.frame(get(getto)), path=dire)
}




gc()


###### RANKING TERCIARIO




catg <- c("cog","soc","mot","med")


# Carregando o arquivo de microrregiÃÂµes



# gerar procentagem de profissoes sofisticadas por municipio, para cada grande regiao


for(categoria in 1:4){
  
  lista_dados_ranking_todos <- list()
  
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names= FALSE)
  
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
        merge(skills_cbo, by = "cbo2002", all.x = TRUE) %>%
        .[, matched := !is.na(ncognitivo)]
      
      profissoes <- profissoes_sofisticadas$...1
      
      # Contar o número de indivíduos com profissões sofisticadas por município
      dados <- dados %>%
        mutate(profissao_sofisticada = ocup2002 %in% profissoes) %>%
        group_by(municipio) %>%
        summarise(total_individuos = n(),
                  total_profissoes_sofisticadas = sum(profissao_sofisticada, na.rm = TRUE),
                  proporcao = total_profissoes_sofisticadas / total_individuos)
      
      lista_dados_ranking_todos[[i]] <- dados
    }
    gc()
  }
  tata <- paste0("lista_rank_todos",catg[categoria])
  assign(tata, lista_dados_ranking_todos)
  gc()
}




for(categoria in 1:4){
  
  davez <- paste0("lista_rank_todos",catg[categoria])
  
  lista_ranks_todos <- get(davez)
  
  # agrupar grandes regioes por ano
  
  # Número de dataframes na lista
  num_dfs <- length(lista_ranks_todos)
  
  # Determinando o número de grupos com base no intervalo de 4
  num_grupos <- 4
  
  # Inicializando uma lista para armazenar os dataframes result_rank_todos_rankantes
  result_rank_todos <- vector("list", num_grupos)
  
  # Loop para agregar os dataframes de acordo com o padrão especificado
  for (i in 1:num_grupos) {
    indices <- seq(i, num_dfs, by = num_grupos)
    
    # Extraindo e combinando os dataframes selecionados na lista
    result_rank_todos[[i]] <- do.call(rbind, lista_ranks_todos[indices])
  }
  
  # Nomeando cada dataframe na lista result_rank_todosante para facilitar a visualização
  names(result_rank_todos) <- paste0("df_", seq_along(result_rank_todos))
  
  toto <- paste0(catg[categoria],"result_rank_todos")
  assign(toto, result_rank_todos)
  
}




ano <- 2019:2022
for(categoria in 1:4){
  
  nome <- paste0(catg[categoria],"result_rank_todos")
  
  for(i in 1:4){
    
    cati <- 
      
      dire <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/", catg[categoria], ano[i]," ranktodos.xlsx")
    dados <- get(nome)
    write_xlsx(dados[[i]][,c(1,4)], path=dire)
  }
}







catg <- c("cog", "soc", "mot", "med")

for(categoria in 1:4){
  
  for(j in 1:4){
    
    nome <- paste0(catg[categoria],"result_rank_todos")
    plana <- get(nome)
    
    if(j == 1){
      stitch <- plana[[1]][,c(1,4)]
    }
    else{
      stitch <- merge(stitch, plana[[j]][,c(1,4)],by = "municipio", all =TRUE)
    }
  }
  
  tipo <- paste0(catg[categoria], "rank") 
  colnames(stitch) <- c("municipio", as.character(2019:2022))
  assign(tipo, stitch)
  
  dire <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/ranking/terciario/", catg[categoria]," ranktodos.xlsx")
  write_xlsx(stitch, path=dire)
}


gc()

######## RANKING TERCIARIO DECIS



catg <- c("cog","soc","mot","med")

# Anos de interesse
anos_interesse <- 2019:2022

serie_anos <- 1:4


for (categoria in 1:4) {
  listas_anos <- list()
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names = FALSE)
  
  # Loop sobre os anos
  for (ano in serie_anos) {
    # Convertendo ano para o formato de dois dígitos
    ano_str <- sprintf("%02d", anos_interesse[ano] %% 100)
    
    # Loop sobre os arquivos
    for (arquivo in seq_along(caminhos_19_22)) {
      # Extrai o ano do arquivo
      ano_arquivo <- str_extract(arquivos[arquivo], pattern = "[[:digit:]]{4}")
      
      # Verifica se o ano do arquivo corresponde ao ano atual do loop
      if (ano_arquivo == as.character(anos_interesse[ano])) {
        
        
        lista_rank_decis <- list()
        prop_lista <- list()
        
        print(ano_str)
        print(caminhos_19_22[arquivo])
        
        dados <- fread(caminhos_19_22[arquivo],
                       select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
          .[naturjur > 2020 & empem3112 == 1 &  (clascnae95>=50000 & clascnae95<75000 | clascnae95>= 80000 & clascnae95 < 95000 | clascnae95 >=99000)] %>%
          .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
          .[, cbo2002 := as.numeric(ocup2002)] %>%
          merge(skills_cbo, by = "cbo2002", all.x = TRUE) %>%
          .[, matched := !is.na(ncognitivo)]
        
        profissoes <- profissoes_sofisticadas$...1
        
        # Contar o número de indivíduos com profissões sofisticadas por município
        dados <- dados %>%
          mutate(profissao_sofisticada = ocup2002 %in% profissoes) %>%
          group_by(municipio) %>%
          summarise(total_individuos = n(),
                    total_profissoes_sofisticadas = sum(profissao_sofisticada, na.rm = TRUE))
        
        for (decil in 1:11) {
          lista_rank_decis[[decil]] <- dados %>%
            filter(municipio %in% lista_decis[[decil]])
        }
        
        for (decil in 1:11){
          total_profis_decis <- sum(lista_rank_decis[[decil]][["total_individuos"]])
          
          soft_profis_decis <- sum(lista_rank_decis[[decil]][["total_profissoes_sofisticadas"]])
          
          prop_lista[decil] <- soft_profis_decis/total_profis_decis
        }
        
        
        titi <- paste0(ano_str, "_lista_props")
        assign(titi, prop_lista, envir = .GlobalEnv)
        
        listas_anos[[ano]] <- get(titi)
        
        gc()
      }
    }
  }
  
  tata <- paste0(catg[categoria], "_lista_ranking_decis")
  assign(tata, listas_anos, envir = .GlobalEnv)
  gc()
}



#salvando



Decil <-1:11

tipos <- c("cog", "soc", "mot", "med")

for(catg in 1:4){
  pla <- paste0(tipos[catg],"_lista_ranking_decis")
  plana <- get(pla)
  
  for(j in 1:4){
    
    for(i in 1:11){
      if(i == 1){
        stitch <- plana[[j]][[1]]
      }
      else{
        stitch <- rbind(stitch, plana[[j]][[i]])
      }
    }
    
    
    if(j == 1){
      finala <- stitch
    }
    else{
      finala <- cbind(finala, stitch)
    }
    
  }
  tipo <- paste0(tipos[catg], "final_rank_decis")
  colnames(finala) <- as.character(2019:2022)
  finala <- cbind(Decil, finala)
  assign(tipo, finala)
  
}


diretorio <- "D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\19-22\\ranking\\terciario\\decis\\"



for (jota in c("cog", "soc", "mot", "med")) {
  getto <- paste0(jota, "final_rank_decis")
  dire <- paste0(diretorio, getto, ".xlsx")
  write_xlsx(as.data.frame(get(getto)), path=dire)
}

gc()
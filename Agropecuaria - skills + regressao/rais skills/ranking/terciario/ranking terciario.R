library(haven)
library(data.table)
library(tidyverse)
library(readxl)

# Listando os caminhos dos arquivos

arquivos <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "200[3-9]|201[0-8]")

caminhos <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos)

# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))


catg <- c("cog","soc","mot","med")


# Carregando o arquivo de microrregiÃÂµes



# gerar procentagem de profissoes sofisticadas por municipio, para cada grande regiao


for(categoria in 1:4){
  
  lista_dados_ranking_todos <- list()
  
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names= FALSE)
  
  for (i in seq_along(caminhos)) {
    
    ano <- str_extract(caminhos[i], pattern = "[[:digit:]]+")
    
    if (ano %in% c(2003:2018)) {
      
      print(ano)
      
      print(caminhos[i])
      
      dados <- fread(caminhos[i],
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
  
  # Determinando o número de grupos com base no intervalo de 16
  num_grupos <- 16
  
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




ano <- 2003:2018
for(categoria in 1:4){
  
  nome <- paste0(catg[categoria],"result_rank_todos")
  
  for(i in 1:16){
    
    cati <- 
      
      dire <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/", catg[categoria], ano[i]," ranktodos.xlsx")
    dados <- get(nome)
    write_xlsx(dados[[i]][,c(1,4)], path=dire)
  }
}







catg <- c("cog", "soc", "mot", "med")

for(categoria in 1:4){
  
  for(j in 1:16){
    
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
  colnames(stitch) <- c("municipio", as.character(2003:2018))
  assign(tipo, stitch)
  
  dire <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/", catg[categoria]," ranktodos.xlsx")
  write_xlsx(stitch, path=dire)
}



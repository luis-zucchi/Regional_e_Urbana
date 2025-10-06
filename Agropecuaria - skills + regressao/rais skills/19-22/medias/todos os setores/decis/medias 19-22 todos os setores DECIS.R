library(haven)
library(data.table)
library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)

# Listando os caminhos_19_22 dos arquivos



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

# Determinando o número de grupos com base no intervalo de 16
num_grupos <- 16

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




for(i in 1:16){
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
  
  for(j in 1:16){
    
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
  
}



diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/19-22/medias/todos os setores/decis/"

diretorio


#salvando

for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, getto, ".xlsx")
  getto <- paste0(jota, "todossetores")
  write_xlsx(get(getto), path=dire)
}


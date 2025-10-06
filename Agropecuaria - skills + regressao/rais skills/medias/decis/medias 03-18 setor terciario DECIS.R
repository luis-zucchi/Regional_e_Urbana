library(haven)
library(data.table)
library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)

# Listando os caminhos dos arquivos

arquivos <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "200[3-9]|201[0-8]")

caminhos <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos)

# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))

# Carregando o arquivo de microrregiÃÂµes





lista_regioes <- list()



for (i in seq_along(caminhos)) {
  
  ano <- str_extract(caminhos[i], pattern = "[[:digit:]]+")
  
  if (ano %in% c(2003:2021)) {
    
    print(ano)
    
    print(caminhos[i])
    
    dados <- fread(caminhos[i],
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

# Determinando o número de grupos com base no intervalo de 16
num_grupos <- 16

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




for(i in 1:16){
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
  
  for(j in 1:16){
    
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
  colnames(finala) <- as.character(2003:2018)
  finala <- cbind(Decil, finala)
  assign(tipo, finala)
  
}



diretorio <- "D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/decis/"

diretorio


#salvando

for (jota in c("cog", "soc", "mot", "med")) {
  dire <- paste0(diretorio, getto, ".xlsx")
  getto <- paste0(jota, "terciario")
  write_xlsx(get(getto), path=dire)
}




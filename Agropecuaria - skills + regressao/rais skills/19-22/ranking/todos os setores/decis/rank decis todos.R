library(haven)
library(data.table)
library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)



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

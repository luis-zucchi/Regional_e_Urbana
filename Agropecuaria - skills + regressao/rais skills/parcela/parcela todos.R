library(haven)
library(data.table)
library(tidyverse)
library(readxl)

# Listando os caminhos dos arquivos

arquivos <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "200[3-9]|201[0-8]")

caminhos <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos)

# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))

profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas")



# Carregando o arquivo de microrregiÃÂµes



# gerar procentagem de profissoes sofisticadas por municipio, para cada grande regiao


lista_cat_parcela <- list()

catg <- c("cog","soc","mot","med")



for(categoria in 1:4){
  
  lista_parcela <- list()
  
  profissoes_sofisticadas <- read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\ranking\\profissoes sofisticadas.xlsx", sheet = categoria, col_names= FALSE)
  
  for (i in seq_along(caminhos)) {
    
    ano <- str_extract(caminhos[i], pattern = "[[:digit:]]+")
    
    if (ano %in% c(2003)) {
      
      print(ano)
      
      print(caminhos[i])
      
      dados <- fread(caminhos[i],
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
        summarise(total_individuos = n(),
                  total_profissoes_sofisticadas = sum(profissao_sofisticada, na.rm = TRUE),
                  proporcao = total_profissoes_sofisticadas / total_individuos)
      
      lista_parcela[[i]] <- dados
      
      
    }
    gc()
  }
  
  num_dfs <- length(lista_parcela)
  
  # Determinando o número de grupos com base no intervalo de 16
  num_grupos <- 16
  
  # Inicializando uma lista para armazenar os dataframes result_parcela_rankantes
  result_parcela <- vector("list", num_grupos)
  
  # Loop para agregar os dataframes de acordo com o padrão especificado
  for (i in 1:num_grupos) {
    indices <- seq(i, num_dfs, by = num_grupos)
    
    # Extraindo e combinando os dataframes selecionados na lista
    result_parcela[[i]] <- do.call(rbind, lista_parcela[indices])
  }
  
  # Nomeando cada dataframe na lista result_parcelaante para facilitar a visualização
  names(result_parcela) <- paste0("df_", seq_along(result_parcela))
  
  rotulo <- paste0(catg[categoria], "parcela")
  
  assign(rotulo, result_parcela)
  
  lista_cat_parcela[[categoria]] <- get(rotulo)
  
  gc()
}








lista_ranks_parcela <- list()

for(categoria in 1:4){
  
  for (i in seq_along(caminhos)) {
    
    ano <- str_extract(caminhos[i], pattern = "[[:digit:]]+")
    
    if (ano %in% c(2003)) {
      
      print(ano)
      
      print(caminhos[i])
      
      dados <- fread(caminhos[i],
                     select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
        .[naturjur>2020 & empem3112==1] %>%
        .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
        .[, cbo2002 := as.numeric(ocup2002)] %>%
        merge(skills_cbo, by = "cbo2002", all.x = TRUE) %>%
        .[, matched := !is.na(ncognitivo)]
      
      profissoes <- profissoes_sofisticadas[categoria]
      
      individuos_com_profissoes <- dados %>%
        filter(ocup2002 %in% profissoes)
      
      # Calcular a proporção
      proporcao1 <- nrow(individuos_com_profissoes) / soft_brasil
      
      proporcao2 <- pop_mun / pop_brasil
      
      proporcao <- proporcao1 / proporcao2
      
      
    }
  }
}














###



lista_regioes_parcela <- list()



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
    
    
    lista_regioes_parcela[[i]] <- dados
    
  }
}




profissoes <- profissoes_sofisticadas[categoria]

# Contar o número de indivíduos com profissões correspondentes
individuos_com_profissoes <- dados %>%
  filter(ocup2002 %in% profissoes)

# Calcular a proporção
proporcao1 <- nrow(individuos_com_profissoes) / soft_brasil

proporcao2 <- pop_mun / pop_brasil

proporcao <- proporcao1 / proporcao2

lista_ranks_parcela[[i]] <- dados










# agrupar grandes regioes por ano


# Número de dataframes na lista
num_dfs <- length(lista_regioes_parcela)

# Determinando o número de grupos com base no intervalo de 16
num_grupos <- 16

# Inicializando uma lista para armazenar os dataframes resultantes
result_parcela <- vector("list", num_grupos)

# Loop para agregar os dataframes de acordo com o padrão especificado
for (i in 1:num_grupos) {
  indices <- seq(i, num_dfs, by = num_grupos)
  
  # Extraindo e combinando os dataframes selecionados na lista
  result_parcela[[i]] <- do.call(rbind, lista_regioes_parcela[indices])
}

# Nomeando cada dataframe na lista resultante para facilitar a visualização
names(result_parcela) <- paste0("df_", seq_along(result_parcela))
















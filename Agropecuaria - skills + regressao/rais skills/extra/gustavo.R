
library(data.table)
library(tidyverse)
library(readxl)

# Listando os caminhos dos arquivos

arquivos <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "200[3-9]|201[0-8]")

caminhos <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos)

# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))

# Carregando o arquivo de microrregiÃµes


pulga <- fread(caminhos[1])


lista_dados <- list()

for(i in seq_along(caminhos)){
  
  ano <- str_extract(caminhos[i], pattern = "[[:digit:]]+")
  
  
  if(ano %in% c(2007,2008)){
    
    print(ano)
    
    
    print(caminhos[i])
    
    dados <- fread(caminhos[i],
                   select=c("municipio", "clascnae95" ,"empem3112", "naturjur", "ocup2002"))%>%
      .[, cnae95 := str_extract(clascnae95, pattern = "[[:digit:]]+")]%>%
      .[, cnae95 := as.numeric(cnae95)]%>%
      .[naturjur>2020 & empem3112==1 &  (cnae95>=50000 & cnae95<75000 | cnae95>= 80000 & cnae95 < 95000 | cnae95 >99000)]%>%
      .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
      .[, cbo2002 := as.numeric(ocup2002)] %>%
      merge(skills_cbo, by = "cbo2002") %>%
      .[, `:=` ()]
    
    
  }else{
    
    print(ano)
    
    
    print(caminhos[i])
    
    dados <- fread(caminhos[i],
                   select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
      .[naturjur>2020 & empem3112==1 &  (cnae95>=50000 & cnae95<75000 | cnae95>= 80000 & cnae95 < 95000 | cnae95 >99000)] %>%
      .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
      .[, cbo2002 := as.numeric(ocup2002)] %>%
      merge(skills_cbo, by = "cbo2002") %>%
      .[, `:=` (quartil_cog = as.integer(cut(ncognitivo, quantile(ncognitivo, probs=0:4/4), include.lowest = TRUE)),
                quartil_motor = as.integer(cut(nmotor, quantile(nmotor, probs=0:4/4), include.lowest = TRUE)),
                quartil_social = as.integer(cut(nsocial, quantile(nsocial, probs=0:4/4), include.lowest = TRUE)),
                quartil_media = as.integer(cut(Media, quantile(Media, probs=0:4/4), include.lowest = TRUE)))]
  }
  
  # Criando a variável do ano da base
  
  dados<-setDT(dados)
  dados[, ano := ano[i]]
  
  dados_cog <- dados %>%
    .[, .(media = mean(ncognitivo, na.rm = TRUE),
          mediana = median(ncognitivo, na.rm = TRUE)),
      by = .(gr, quartil_cog)] %>%
    melt(id.vars = c("gr", "quartil_cog"), variable.factor = FALSE) %>%
    setnames("quartil_cog", "quartil") %>%
    .[, id_auxiliar := "skills_cognitivas"]
  
  dados_motor <- dados %>%
    .[, .(media = mean(nmotor, na.rm = TRUE),
          mediana = median(nmotor, na.rm = TRUE)),
      by = .(gr, quartil_motor)] %>%
    melt(id.vars = c("gr", "quartil_motor"), variable.factor = FALSE) %>%
    setnames("quartil_motor", "quartil") %>%
    .[, id_auxiliar := "skills_motoras"]
  
  dados_social <- dados %>%
    .[, .(media = mean(nsocial, na.rm = TRUE),
          mediana = median(nsocial, na.rm = TRUE)),
      by = .(gr, quartil_social)] %>%
    melt(id.vars = c("gr", "quartil_social"), variable.factor = FALSE) %>%
    setnames("quartil_social", "quartil") %>%
    .[, id_auxiliar := "skills_social"]
  
  dados_media <- dados %>%
    setnames("Media", "skill_media", skip_absent = TRUE)%>%
    .[, .(media = mean(skill_media, na.rm = TRUE),
          mediana = median(skill_media, na.rm = TRUE)),
      by = .(gr, quartil_media)] %>%
    melt(id.vars = c("gr", "quartil_media"), variable.factor = FALSE) %>%
    setnames("quartil_media", "quartil") %>%
    .[, id_auxiliar := "skills_medias"]
  
  
  dados_geral <- dados%>%
    .[, .(media_cognitivo_geral = mean(ncognitivo, na.rm = TRUE),
          media_social_geral = mean(nsocial, na.rm = TRUE),
          media_motor_geral = mean(nmotor, na.rm = TRUE),
          media_media_geral = mean(skill_media, na.rm = TRUE),
          media_div_geral = mean(diversidade, na.rm = TRUE),
          mediana_cognitivo_geral = median(ncognitivo, na.rm = TRUE),
          mediana_social_geral = median(nsocial, na.rm = TRUE),
          mediana_motor_geral = median(nmotor, na.rm = TRUE),
          mediana_media_geral = median(skill_media, na.rm = TRUE),
          mediana_div_geral = median(diversidade, na.rm = TRUE)),
      by = gr]
  
  rm(dados)
  gc()
  
  dados_final <- rbind(dados_cog, dados_motor, dados_social, dados_media) %>%
    merge(dados_geral, by = "gr") %>%
    .[, ano_dados := ano]
  
  lista_dados[[i]] <- dados_final
  
}


# Juntando os dados da lista em uma única base


dados_consolidados <- rbindlist(lista_dados)

saveRDS(dados_consolidados, "dados_consolidados_br_quartil_final")

plot(dados_consolidados$media_cognitivo_geral)

#__________________________________________________________

db_br_uf =  dados_consolidados %>%
  .[quartil==1 & variable == "media" ]



write.csv(db_br_uf, "bd_br_rg_1_quartil.csv")

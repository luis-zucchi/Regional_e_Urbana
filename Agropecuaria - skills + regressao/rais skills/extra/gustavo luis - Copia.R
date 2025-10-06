# Instale o pacote haven, se ainda não estiver instalado
install.packages("haven")

# Carregue o pacote
library(haven)
library(data.table)
library(tidyverse)
library(readxl)

# Listando os caminhos dos arquivos

arquivos <- list.files("D:/Bases/MTE/Vinc/arquivos-csv/", pattern = "200[3-9]|201[0-8]")

caminhos <- paste0("D:/Bases/MTE/Vinc/arquivos-csv/", arquivos)

# Carregando o arquivo de skills por CBO

skills_cbo <- setDT(read_xlsx("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\skills_cbo (2).xlsx"))

# Carregando o arquivo de microrregiÃƒÂµes





lista_dados <- list()

seq_along(caminhos)[20]

for (i in seq_along(caminhos)) 
  
  ano <- str_extract(caminhos[seq_along(caminhos)[20]], pattern = "[[:digit:]]+")
  
  if (ano %in% c(2006)) {
    
        print(ano)
    
    
    print(caminhos[seq_along(caminhos)[20]])
    
    dados <- fread(caminhos[seq_along(caminhos)[20]],
                   select = c("municipio", "clascnae95", "empem3112", "naturjur", "ocup2002")) %>%
      .[naturjur>2020 & empem3112==1 &  (clascnae95>=50000 & clascnae95<75000 | clascnae95>= 80000 & clascnae95 < 95000 | clascnae95 >=99000)] %>%
      .[, ocup2002 := str_extract(ocup2002, pattern = "[[:digit:]]+")] %>%
      .[, cbo2002 := as.numeric(ocup2002)] %>%
      merge(skills_cbo, by = "cbo2002")

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

  }



l2006 <- lista_dados[[4]]



for (a in c(20,36,52,68)){
  l2007 <- rbind(l2006, lista_dados[[a]])
}




# Leia o arquivo .dta
data <- read_dta("D:\\Pessoal\\Luis_Souza\\Agropecuaria\\rais skills\\media_municip_07.dta")

# Veja os dados
print(data)



head(merg)
################################################
caminhos[5]
caminhos[20]

pulga <- fread(caminhos[20])

pulga$cbo2002 <- substr(pulga$ocup2002,5,10)

pulga$cbo2002 <- as.numeric(pulga$cbo2002)

mergado <- left_join(pulga,skills_cbo, by = "cbo2002")

merg <- mergado[,c("municipio", "clascnae95", "empem3112", "naturjur", "cbo2002","ncognitivo"  ,"nsocial" ,    "nmotor"   ,   "nmed")]

merg <- !is.na(merg)

merg1 <- subset(merg,merg$naturjur > 2020 & merg$empem3112==1)

merg2<- merg1[merg1$clascnae95>=50000 & merg1$clascnae95<75000 | merg1$clascnae95>= 80000 & merg1$clascnae95 < 95000 | merg1$clascnae95 >=99000]

merg2 <- merg1 %>% 
         group_by(municipio) %>% 
         mutate(med_cog = mean(ncognitivo, na.rm = TRUE))



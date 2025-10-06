# Supondo que seu DataFrame se chame 'dados'
# Transforme os dados para o formato longo
library(tidyr)
library(dplyr)
#install.packages("tidyr")
install.packages("openxlsx")
install.packages("write_xlsx")
library(readxl)
library(openxlsx)
library(writexl)

catg <- c("cog", "soc", "mot", "med")

for(i in 1:4){

diretorio <- paste0(catg[i], "final_rank_decis.xlsx")

dados <-read_excel(diretorio)



dados_long <- dados %>%
  pivot_longer(cols = -Decil, names_to = "Ano", values_to = "Valor") %>%
  mutate(Ano = as.numeric(Ano))  # Convertendo 'Ano' para numérico se não estiver



##### decis como dummies

# Criando as variáveis dummy para os decis
dados_long <- dados_long %>%
  mutate(Decil = factor(Decil))

# Fazendo a regressão
modelo <- lm(Valor ~ Ano + Decil, data = dados_long)

# Resumo do modelo
resumo <- summary(modelo)

coef <- paste0(catg[i],"_coeficientes")

assign(coef,resumo$coefficients)




##### anos como dummies



# Criando as variáveis dummy para os anos
dados_long_inv <- dados_long %>%
  mutate(Ano = factor(Ano))

# Fazendo a regressão
modelo_inv <- lm(Valor ~ Decil + Ano, data = dados_long_inv)

# Resumo do modelo
resumo_inv <- summary(modelo_inv)

coef_inv <- paste0(catg[i],"_coeficientes_inv")


assign(coef_inv,resumo_inv$coefficients)


}

for(i in 1:4){
    getto <- paste0(catg[i], "_coeficientes")
    dire <- paste0("C:\\Users\\luis.souza\\Downloads\\", getto, "_todos.xlsx")
    bb <- get(getto)
    if (!is.data.frame(bb)) {
      bb <- as.data.frame(bb)
    }
    bb$RowNames <- rownames(bb)
    bb <- bb %>% select(RowNames, everything())
    write_xlsx(bb, path=dire)
}


for(i in 1:4){
  getto <- paste0(catg[i], "_coeficientes_inv")
  dire <- paste0("C:\\Users\\luis.souza\\Downloads\\", getto, "_inv_todos.xlsx")
  bb <- get(getto)
  if (!is.data.frame(bb)) {
    bb <- as.data.frame(bb)
  }
  bb$RowNames <- rownames(bb)
  bb <- bb %>% select(RowNames, everything())
  write_xlsx(bb, path=dire)
}


















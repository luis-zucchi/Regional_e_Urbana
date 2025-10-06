library(readxl)
library(writexl)

for (i in 3:21) {
  arqui <- paste0("social_b_prop_", sprintf("%02d", i))
  path <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/final b/", arqui, ".xlsx")
  assign(arqui, read_excel(path, col_names = FALSE))
}




for(i in 3:21){
  plan <- paste0("social_b_prop_", sprintf("%02d", i))
  
  # Obter a data frame pelo nome
  df <- get(plan)
  
  # Renomear as colunas
  colnames(df) <- c("municipio", paste0("soc",i))
  
  # Atribuir de volta ao nome original
  assign(plan, df)
}




socs_prop <- social_prop_03

# Iterando de 4 a 21 para fazer a junção com as outras data frames
for(i in 4:21){
  tcha <- paste0("social_b_prop_", sprintf("%02d", i))
  socs_prop <- merge(socs_prop, get(tcha), all=TRUE, by=1)  
}



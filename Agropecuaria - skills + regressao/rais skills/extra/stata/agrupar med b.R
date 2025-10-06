library(readxl)
library(writexl)

for (i in 3:21) {
  arqui <- paste0("media_b_prop_", sprintf("%02d", i))
  path <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/final b/", arqui, ".xlsx")
  assign(arqui, read_excel(path, col_names = FALSE))
}




for(i in 3:21){
  plan <- paste0("media_b_prop_", sprintf("%02d", i))
  
  # Obter a data frame pelo nome
  df <- get(plan)
  
  # Renomear as colunas
  colnames(df) <- c("municipio", paste0("med",i))
  
  # Atribuir de volta ao nome original
  assign(plan, df)
}




meds_prop <- media_prop_03

# Iterando de 4 a 21 para fazer a junção com as outras data frames
for(i in 4:21){
  tcha <- paste0("media_b_prop_", sprintf("%02d", i))
  meds_prop <- merge(meds_prop, get(tcha), all=TRUE, by=1)  
}





# Lista com os nomes das variáveis
variaveis <- list(cogs_prop = cogs_prop, socs_prop = socs_prop, mots_prop = mots_prop, meds_prop = meds_prop)

# Loop para salvar cada dataframe em um arquivo Excel
for (nome in names(variaveis)) {
  arquivo_excel <- paste0(nome, "_03-21.xlsx")
  write_xlsx(variaveis[[nome]], path = arquivo_excel)
}

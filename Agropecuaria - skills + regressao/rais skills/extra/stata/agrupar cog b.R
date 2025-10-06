library(readxl)
library(writexl)

for (i in 3:21) {
  arqui <- paste0("cognitivo_b_prop_", sprintf("%02d", i))
  path <- paste0("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/ranking/final b/", arqui, ".xlsx")
  assign(arqui, read_excel(path, col_names = FALSE))
}




cogs_prop <- merge(cognitivo_b_prop_03,cognitivo_b_prop_04, all=TRUE, by =1)
cogs_prop <- merge(cogs_prop,cognitivo_b_prop_05, all=TRUE, by =1)


for(i in 3:21){
  plan <- paste0("cognitivo_b_prop_", sprintf("%02d", i))
  
  # Obter a data frame pelo nome
  df <- get(plan)
  
  # Renomear as colunas
  colnames(df) <- c("municipio", paste0("cog",i))
  
  # Atribuir de volta ao nome original
  assign(plan, df)
}




cogs_prop <- cognitivo_b_prop_03

# Iterando de 4 a 21 para fazer a junção com as outras data frames
for(i in 4:21){
  tcha <- paste0("cognitivo_b_prop_", sprintf("%02d", i))
  cogs_prop <- merge(cogs_prop, get(tcha), all=TRUE, by=1)  
}



cogs_prop <- merge(cognitivo_b_prop_03,cognitivo_b_prop_04, all=TRUE, by =1)




cogs_prop <- cognitivo_b_prop_03
cogs_prop <- merge(cognitivo_b_prop_03, cognitivo_b_prop_04, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_05, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_06, all=TRUE, by=1)
cogs_prop <- drop
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_07, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_08, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_09, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_10, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_11, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_12, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_13, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_14, all=TRUE, by=1)

cogs_prop <- merge(cogs_prop, cognitivo_b_prop_15, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_16, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_17, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_18, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_19, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_20, all=TRUE, by=1)
cogs_prop <- merge(cogs_prop, cognitivo_b_prop_21, all=TRUE, by=1)











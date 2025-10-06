# Carregando o arquivo específico
pulga <- fread(caminhos[17])

# Extraindo e convertendo o código ocupacional
pulga$cbo2002 <- substr(pulga$ocup2002, 5, 10)
pulga$cbo2002 <- as.numeric(pulga$cbo2002)

# Realizando o merge com o arquivo de skills por CBO
mergado <- left_join(pulga, skills_cbo, by = "cbo2002")

# Selecionando apenas as colunas necessárias
merg <- mergado[, c("municipio", "clascnae95", "empem3112", "naturjur", "cbo2002", "ncognitivo", "nsocial", "nmotor", "nmed")]

# Filtrando valores NA em ncognitivo
merg <- subset(merg, !is.na(ncognitivo))

# Filtrando dados conforme os critérios especificados
merg1 <- subset(merg, naturjur > 2020 & empem3112 == 1)
merg2 <- subset(merg1, (clascnae95 >= 50000 & clascnae95 < 75000) | 
                  (clascnae95 >= 80000 & clascnae95 < 95000) | 
                  (clascnae95 >= 99000))

# Calculando as médias por município
merg2 <- merg2 %>%
  group_by(municipio) %>%
  summarise(
    media_ncognitivo = mean(ncognitivo, na.rm = TRUE),
    media_nsocial = mean(nsocial, na.rm = TRUE),
    media_nmotor = mean(nmotor, na.rm = TRUE),
    media_nmed = mean(nmed, na.rm = TRUE)
  )

# Mantendo apenas a primeira observação para cada município (desnecessário após summarise)
# merg2 <- merg2[order(merg2$municipio), ]
# merg2 <- merg2[!duplicated(merg2$municipio), ]

# Selecionando as colunas finais (já feito no summarise)
final_data <- merg2[, c("municipio", "media_ncognitivo", "media_nsocial", "media_nmotor", "media_nmed")]

head(final_data)

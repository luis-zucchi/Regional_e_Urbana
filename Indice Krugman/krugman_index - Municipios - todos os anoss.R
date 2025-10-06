library(readxl)
library(dplyr)
library(writexl)

# Inicializar uma lista para armazenar as matrizes
lista_matrizes <- list()

for (ano in 2004:2021) {
  
  # Carregar a base de dados
  aba <- as.character(ano)
  matriz_base <- read_xlsx("D:/Pessoal/Luis_Souza/Setores/Matriz Krugman municipios.xlsx", sheet = aba)
  
  # Remover as colunas desnecessárias
  matriz_base <- matriz_base[, -c(1, 2)]
  
  # Calcular a matriz B
  matriz_k <- as.matrix(matriz_base) %>%
    dist(method = "manhattan") %>%
    as.matrix()
  
  # Armazenar a matriz na lista
  nome <- paste0("matriz_", ano)
  lista_matrizes[[nome]] <- matriz_k
  
  # Salvar a matriz em um arquivo Excel
  #arquivo <- paste0("D:/Pessoal/Luis_Souza/Setores/municipios_krugman_", ano, ".xlsx")
  #write_xlsx(as.data.frame(matriz_k), arquivo)
}

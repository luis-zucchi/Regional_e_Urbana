library(readxl)
install.packages("broom")
library(broom)
install.packages("knitr")
library(knitr)
install.packages("kableExtra")
library(kableExtra)
install.packages("ggplot2")
library(ggplot2)
install.packages("stargazer")
library(stargazer)

# Definir o caminho do arquivo Excel
caminho_arquivo <- "D:/Pessoal/Luis_Souza/Fase 7/regressão1.xlsx"

# Carregar a planilha Excel
dados <- read_excel(caminho_arquivo)

# Visualizar as primeiras linhas dos dados para garantir que foram carregados corretamente
head(dados)

# Converter a coluna 'índice' para numeric (caso seja necessário)
dados$índice <- as.numeric(dados$índice)

# Realizar a regressão linear simples
modelo_regressao <- lm(cres_pib ~ índice, data = dados)

# Visualizar os resultados da regressão
summary(modelo_regressao)

stargazer(modelo_regressao, type = "text", title = 'Resultados', 
          covariate.labels = c("Índice HH", "Intercepto"), digits = 6, 
          t.auto = TRUE,  # Incluir valores t
          p.auto = TRUE)  # Incluir p-valores


plot(dados$índice, dados$cres_pib, main = "Gráfico de Dispersão com Linha de Regressão", 
     xlab = "Índice", ylab = "Cres_PIB")
abline(modelo_regressao, col = "red")

# Criar um gráfico de dispersão com linha de tendência
grafico <- ggplot(dados, aes(x = índice, y = cres_pib)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Gráfico de Dispersão com Linha de Tendência",
       x = "Índice Herfindahl-Hirschman em t-1",
       y = "Cres.PIB em t")

# Imprimir o gráfico
print(grafico)

# Gráfico de resíduos
plot(modelo_regressao, which = 1)






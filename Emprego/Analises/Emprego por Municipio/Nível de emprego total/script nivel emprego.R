setwd("d:/Users/luis.souza/Downloads/1 - Indústria")
getwd()

ind_2002 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2002.csv", sep=";")
ind_2003 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2003.csv", sep=";")
ind_2004 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2004.csv", sep=";")
ind_2005 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2005.csv", sep=";")
ind_2006 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2006.csv", sep=";")
ind_2007 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2007.csv", sep=";")
ind_2008 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2008.csv", sep=";")
ind_2009 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2009.csv", sep=";")
ind_2010 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2010.csv", sep=";")
ind_2011 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2011.csv", sep=";")
ind_2012 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2012.csv", sep=";")
ind_2013 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2013.csv", sep=";")
ind_2014 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2014.csv", sep=";")
ind_2015 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2015.csv", sep=";")
ind_2016 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2016.csv", sep=";")
ind_2017 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2017.csv", sep=";")
ind_2018 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2018.csv", sep=";")
ind_2019 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2019.csv", sep=";")
ind_2020 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2020.csv", sep=";")
ind_2021 <- read.csv("d:/Users/luis.souza/Downloads/1 - Indústria/ind_2021.csv", sep=";")


# Crie um vetor vazio para armazenar os nomes
nomes <- c()

# Use um loop for para gerar os nomes
for (ano in 2002:2021) {
  nome <- paste("ind_", ano, sep = "")
  nomes <- c(nomes, nome)
}

# Visualize a lista de nomes gerados
print(nomes)


# gerando o data frame final
# Crie uma lista para armazenar os data frames
lista_data_frames <- list()

# Loop através dos nomes e leia os data frames
for (i in nomes) {
  # Crie o nome do arquivo com base no valor atual de i
  nome_arquivo <- paste("d:/Users/luis.souza/Downloads/1 - Indústria/", i, ".csv", sep = "")
  
  # Leia o arquivo CSV
  df <- read.csv(nome_arquivo, sep = ";")
  
  # Adicione o data frame à lista
  lista_data_frames[[i]] <- df
}

# Combine os data frames na lista em um único data frame
industria <- do.call(rbind, lista_data_frames)


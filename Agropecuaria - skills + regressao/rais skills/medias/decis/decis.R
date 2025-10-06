library(haven)
library(data.table)
library(tidyverse)
library(readxl)
library(writexl)
library(openxlsx)

municipios_pop <- read_excel("D:/Pessoal/Luis_Souza/Agropecuaria/rais skills/medias/decis/municipios pop.xlsx")




pop <- municipios_pop$pop

lista_decis <- list()

for(i in 1:10){
  if(i ==1){
    nome <- paste0("decil_",i)
    p <- length(pop)/10
    decil <- as.data.frame(municipios_pop[1:p,])
    decil <- decil[complete.cases(decil), ]
    decil <- decil$codigo ##tira a populacao
    assign(nome,decil)
    lista_decis[[i]] <- decil
  } 
  else{
    nome <- paste0("decil_",i)
    p<- i*length(pop)/10
    q <- (i-1)*length(pop)/10
    decil <- as.data.frame(municipios_pop[(q+1):p,])
    decil <- decil[complete.cases(decil), ]
    decil <- decil$codigo ##tira a populacao
    assign(nome,decil)
    lista_decis[[i]] <- decil
  }
}


r <- length(pop)/20
s <- 19*r+0.5
t <- length(pop)

quintil <- as.data.frame(municipios_pop[s:t,])
quintil <- quintil$codigo ##tira a populacao

lista_decis[[11]] <- quintil


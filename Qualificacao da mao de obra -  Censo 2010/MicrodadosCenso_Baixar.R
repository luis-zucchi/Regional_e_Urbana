#install.packages('readr', 'SAScii', 'tidyverse')
#install.packages("devtools" , repos = "http://cran.rstudio.com/")
#install_github("ajdamico/lodown" , dependencies = TRUE)
library(devtools)
library(lodown)
library(tidyverse)
library(writexl)

#lodown( "censo" , output_dir = file.path( path.expand( "~" ) , "CENSO" ) )

censo_cat <-
  get_catalog( "censo" ,
               output_dir = file.path( path.expand( "~" ) , "CENSO" ) )

censo_cat <- subset( censo_cat , year == 2010 )

vars_censo <- c("v0002","v0001","v6036","v0635","v0648")

catalog <- censo_cat
censo_tot <- data.frame()

#mudar nome coluna para estado
nomes_colunas <- c("full_url", "year", "estado", "output_folder", "pes_sas", "dom_sas", "fam_sas", "fpc1","fpc2", "fpc3","fpc4","fpc5","weight")

colnames(censo_cat) <- nomes_colunas

censo_cat$estado

dicionario <- list(
  "ro10" = "11",
  "ac10" = "12",
  "am10" = "13",
  "rr10" = "14",
  "pa10" = "15",
  "ap10" = "16",
  "to10" = "17",
  "ma10" = "21",
  "pi10" = "22",
  "ce10" = "23",
  "rn10" = "24",
  "pb10" = "25",
  "pe10" = "26",
  "al10" = "27",
  "se10" = "28",
  "ba10" = "29",
  "mg10" = "31",
  "es10" = "32",
  "rj10" = "33",
  "sp110" = "35_outras",
  "sp2_rm10" = "35_RMSP",
  "pr10" = "41",
  "sc10" = "42",
  "rs10" = "43",
  "ms10" = "50",
  "mt10" = "51",
  "go10" = "52",
  "df10" = "53"
)

dicio_sigla <- list(
  "ro10" = "RO",
  "ac10" = "AC",
  "am10" = "AM",
  "rr10" = "RR",
  "pa10" = "PA",
  "ap10" = "AP",
  "to10" = "TO",
  "ma10" = "MA",
  "pi10" = "PI",
  "ce10" = "CE",
  "rn10" = "RN",
  "pb10" = "PB",
  "pe10" = "PE",
  "al10" = "AL",
  "se10" = "SE",
  "ba10" = "BA",
  "mg10" = "MG",
  "es10" = "ES",
  "rj10" = "RJ",
  "sp110" = "SP1",
  "sp2_rm10" = "SP2-RM",
  "pr10" = "PR",
  "sc10" = "SC",
  "rs10" = "RS",
  "ms10" = "MS",
  "mt10" = "MT",
  "go10" = "GO",
  "df10" = "DF"
)

dicio_sigla$"ro10"

# Converte arquivo de instruções de importação SAS para o R
  #for(state in censo_cat$estado){
  #print(paste0('Gerando DF para o estado: ', state))
  
  #cod_estado <- dicionario[[as.character(state)]]
  #print(paste0('Nome do estado: ', cod_estado))
  
 # sigla_estado <- dicio_sigla[[as.character(state)]]

  
 # catalog <- censo_cat %>% filter(estado == state)
 # row.names(catalog) <- NULL
 # sas_input <- SAScii::parse.SAScii(catalog$pes_sas[1]) %>%
  #  dplyr::mutate(varname = stringr::str_to_lower(varname))
  # Importar arquivo TXT
 # pes_file <- paste0(catalog$output_folder[1], "/", catalog$estados[1], "/" ,sigla_estado, "/", "Amostra_Pessoas", "_",  cod_estado,".txt")
 # raw_censo <- readr::read_fwf(
  #  file = pes_file,
   # col_positions = readr::fwf_widths(
    #  widths = abs(sas_input$width),
     # col_names = sas_input$varname
    #),
    #col_types = paste0(
     # ifelse(
      #  !(sas_input$varname %in% vars_censo),
       # "_",
        #ifelse(sas_input$char, "c", "d")
      #),
      #collapse = ""
    #)
  #)
  #if (catalog$estados[1] == 'AC') {
   # censo_tot <- raw_censo
#  } else {
 #   censo_tot <- bind_rows(censo_tot, raw_censo)
  #}
#}


#####################
# SEGUNDA PARTE

censo_tot <- NULL

for (state in censo_cat$estado) {
  print(paste0('Gerando DF para o estado: ', state))
  cod_estado <- dicionario[[as.character(state)]]
  sigla_estado <- dicio_sigla[[as.character(state)]]
  
  catalog <- censo_cat %>% filter(estado == state)
  row.names(catalog) <- NULL

  
  sas_input <- SAScii::parse.SAScii(catalog$pes_sas[1]) %>%
    dplyr::mutate(varname = stringr::str_to_lower(varname))
  
  pes_file <- paste0(catalog$output_folder[1], "/", sigla_estado, "/", "Amostra_Pessoas", "_", cod_estado, ".txt")
  
  raw_censo <- readr::read_fwf(
    file = pes_file,
    col_positions = readr::fwf_widths(
      widths = abs(sas_input$width),
      col_names = sas_input$varname
    ),
    col_types = paste0(
      ifelse(
        !(sas_input$varname %in% vars_censo),
        "_",
        ifelse(sas_input$char, "c", "d")
      ),
      collapse = ""
    )
  )
  
  s <- raw_censo
  t <- paste0()
  
  if (catalog$estado[1] == 'ac10') {
    censo_tot <- raw_censo
  } else {
    censo_tot <- bind_rows(censo_tot, raw_censo)
  }
  
}

original <- censo_tot




## ANALISE
#completa com NA os valores fora da faixz
censo_tot$v6036 <- ifelse(censo_tot$v6036 >= 18 & censo_tot$v6036 <= 65, censo_tot$v6036, NA)
#elimina as linhas com NA
censo_tot <- censo_tot[complete.cases(censo_tot$v6036), ]

## 1
#novo df com pessoas com ensino superior
censo_superior <- censo_tot[!is.na(censo_tot$v0635), ]

#numero de pessoas por municipio
censo_tot$mun <- paste0(censo_tot$v0001, censo_tot$v0002)
censo_superior$mun <- paste0(censo_superior$v0001, censo_superior$v0002)


valores_unicos <- unique(censo_tot$mun)
contagem_valores <- table(censo_tot$mun)

pessoas_municipio <- data.frame(mun = as.character(valores_unicos), contagem = as.numeric(contagem_valores))

#numero de pessoas com ensino superior por municipio
valores_unicos_sup <- unique(censo_superior$mun)
contagem_valores_sup <- table(censo_superior$mun)

pessoas_sup_municipio <- data.frame(mun = as.character(valores_unicos_sup), contagem = as.numeric(contagem_valores_sup))

pessoas_municipio <- cbind(pessoas_municipio, pessoas_sup_municipio$contagem)

pessoas_municipio$porcentagem_sup <- pessoas_municipio$`pessoas_sup_municipio$contagem`/pessoas_municipio$contagem

#exportando
arquivo_excel <- "Pessoas com ensino superior por municipio.xlsx"

#write_xlsx(pessoas_municipio, path = arquivo_excel)


## 2
#novo df com pessoas que trabalham
censo_empregados <- censo_tot[!is.na(censo_tot$v0648), ]

#novo df com pessoas com ensino superior
censo_emp_superior <- censo_empregados[!is.na(censo_empregados$v0635), ]

#numero de pessoas por municipio
censo_empregados$mun <- paste0(censo_empregados$v0001, censo_empregados$v0002)
censo_emp_superior$mun <- paste0(censo_emp_superior$v0001, censo_emp_superior$v0002)


valores_emp_unicos <- unique(censo_empregados$mun)
contagem_valores_emp <- table(censo_empregados$mun)

pessoas_emp_municipio <- data.frame(mun = as.character(valores_emp_unicos), contagem = as.numeric(contagem_valores_emp))

#numero de pessoas com ensino superior por municipio
valores_emp_unicos_sup <- unique(censo_emp_superior$mun)
contagem_valores_emp_sup <- table(censo_emp_superior$mun)

pessoas_sup_emp_municipio <- data.frame(mun = as.character(valores_emp_unicos_sup), contagem = as.numeric(contagem_valores_emp_sup))

pessoas_emp_municipio <- cbind(pessoas_emp_municipio, pessoas_sup_emp_municipio$contagem)

pessoas_emp_municipio$porcentagem_sup <- pessoas_emp_municipio$`pessoas_sup_emp_municipio$contagem`/pessoas_emp_municipio$contagem

#exportando
arquivo_excel <- "Pessoas com ensino superior por municipio (empregadas).xlsx"

#write_xlsx(pessoas_emp_municipio, path = arquivo_excel)





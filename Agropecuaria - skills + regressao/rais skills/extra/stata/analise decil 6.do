use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear

rename municipio codigo

destring codigo, replace

merge m:1 codigo using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\decis\decil6.dta", keep(match)

drop _merge

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\stata\cognitivo_unique.dta"





// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)


 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
egen total_ocup = count(ocup2002)
egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched


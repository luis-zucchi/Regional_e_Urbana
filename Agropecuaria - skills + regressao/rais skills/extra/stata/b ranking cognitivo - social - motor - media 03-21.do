
// Carregar o dataset cognitivo
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo.dta", clear 

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

*duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta", replace


*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"



// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co03_prop_cognitivo_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne03_prop_cognitivo_b.dta", replace




************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no03_prop_cognitivo_b.dta", replace





************************** SUDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_cognitivo_meiodocaminho.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_cognitivo_meiodocaminho.dta", clear 
 keep if empem3112 == "1"
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

// Criar um dataset com a proporção por município
collapse (mean) proportion_matched, by(municipio)

// Salvar o novo dataset
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_cognitivo_b.dta", replace






*********************** SUL


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su03_prop_cognitivo_b.dta", replace











*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2004_com_matched_cognitivo.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co04_prop_cognitivo_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2004_com_matched_cognitivo.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne04_prop_cognitivo_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2004_com_matched_cognitivo.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no04_prop_cognitivo_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2004_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se04_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2004_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su04_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co05_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne05_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no05_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se05_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su05_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co06_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne06_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no06_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se06_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su06_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co07_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne07_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no07_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se07_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su07_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co08_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne08_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no08_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se08_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su08_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co09_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne09_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no09_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se09_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su09_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co10_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne10_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no10_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se10_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su10_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co11_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne11_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no11_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se11_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su11_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co12_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne12_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no12_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se12_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su12_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co13_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne13_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no13_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se13_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su13_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co14_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne14_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no14_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se14_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su14_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co15_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne15_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no15_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se15_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su15_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co16_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne16_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no16_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se16_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su16_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co17_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne17_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no17_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se17_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su17_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co18_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne18_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no18_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se18_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su18_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co19_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne19_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no19_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj19_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp19_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su19_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co20_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne20_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no20_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj20_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp20_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su20_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co21_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne21_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no21_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj21_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp21_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\cognitivo_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su21_prop_cognitivo_b.dta", replace
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
































// Carregar o dataset social
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta", replace


***********************
// Carregar o dataset social copia
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social - Copia.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
tostring ocup2002, replace
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2003_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co03_prop_social_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2003_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne03_prop_social_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2003_com_matched_social.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no03_prop_social_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2003_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2003_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su03_prop_social_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2004_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co04_prop_social_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2004_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne04_prop_social_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2004_com_matched_social.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no04_prop_social_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2004_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se04_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2004_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su04_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co05_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne05_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no05_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se05_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su05_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co06_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne06_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no06_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se06_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su06_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co07_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne07_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no07_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se07_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su07_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co08_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne08_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no08_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se08_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su08_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co09_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne09_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no09_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se09_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su09_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co10_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne10_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no10_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se10_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su10_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) form at(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co11_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne11_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no11_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se11_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su11_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co12_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne12_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no12_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se12_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su12_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co13_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne13_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no13_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se13_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su13_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co14_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne14_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no14_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se14_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su14_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co15_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne15_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no15_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se15_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su15_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co16_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne16_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no16_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se16_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su16_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co17_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne17_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no17_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se17_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su17_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co18_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne18_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no18_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se18_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su18_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co19_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne19_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no19_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj19_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp19_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su19_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co20_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne20_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no20_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj20_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp20_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su20_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co21_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne21_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no21_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj21_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp21_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\social_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su21_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 














// Carregar o dataset motor
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta", replace


***********************
// Carregar o dataset motor copia
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor - Copia.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
tostring ocup2002, replace
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2003_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co03_prop_motor_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2003_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne03_prop_motor_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2003_com_matched_motor.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no03_prop_motor_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2003_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2003_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su03_prop_motor_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2004_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co04_prop_motor_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2004_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne04_prop_motor_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2004_com_matched_motor.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no04_prop_motor_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2004_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se04_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2004_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su04_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co05_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne05_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no05_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se05_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su05_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co06_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne06_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no06_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se06_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su06_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co07_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne07_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no07_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se07_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su07_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co08_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne08_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no08_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se08_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su08_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co09_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne09_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no09_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se09_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su09_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co10_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne10_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no10_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se10_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su10_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co11_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne11_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no11_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se11_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su11_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co12_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne12_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no12_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se12_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su12_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co13_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne13_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no13_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se13_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su13_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co14_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne14_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no14_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se14_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su14_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co15_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne15_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no15_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se15_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su15_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co16_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne16_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no16_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se16_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su16_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co17_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne17_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no17_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se17_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su17_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co18_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne18_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no18_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se18_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su18_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co19_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne19_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no19_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj19_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp19_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su19_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co20_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne20_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no20_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj20_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp20_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su20_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co21_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne21_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no21_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj21_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp21_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\motor_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su21_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 


























// Carregar o dataset media
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta", replace


***********************
// Carregar o dataset media copia
use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media - Copia.dta", clear 
 keep if empem3112 == "1"

// Verificar duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
tostring ocup2002, replace
// Salvar o dataset sem duplicatas
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2003_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co03_prop_media_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2003_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne03_prop_media_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2003_com_matched_media.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no03_prop_media_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2003_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se03_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2003_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su03_prop_media_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2004_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co04_prop_media_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2004_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne04_prop_media_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"

// Verificar o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2004_com_matched_media.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no04_prop_media_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2004_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se04_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2004_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su04_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co05_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne05_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no05_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se05_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su05_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co06_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne06_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no06_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se06_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su06_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co07_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne07_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no07_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se07_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su07_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co08_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne08_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no08_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se08_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su08_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co09_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne09_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no09_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se09_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su09_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co10_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne10_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no10_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se10_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su10_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co11_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne11_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no11_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se11_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su11_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co12_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne12_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no12_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se12_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su12_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co13_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne13_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no13_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se13_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su13_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co14_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne14_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no14_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se14_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su14_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co15_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne15_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no15_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se15_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su15_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co16_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne16_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no16_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se16_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su16_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co17_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne17_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no17_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se17_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su17_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co18_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne18_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no18_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sudeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\se18_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su18_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co19_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne19_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no19_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj19_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp19_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su19_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co20_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne20_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no20_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj20_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp20_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su20_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\centrooeste2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\co21_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\nordeste2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\ne21_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\norte2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\no21_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\mgesrj21_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sp21_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\media_unique_copia.dta"
 
// Verificar o resultado da mesclagem
drop ocupp2002; keep if empem3112 == "1"
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\sul2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\su21_prop_media_b.dta", replace
 





// Carregar o dataset cognitivo
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo.dta", clear 

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta", replace


*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co03_prop_cognitivo_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne03_prop_cognitivo_b.dta", replace




************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no03_prop_cognitivo_b.dta", replace





************************** SUDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_cognitivo_meiodocaminho.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_cognitivo_meiodocaminho.dta", clear 
 keep if empem3112 == "1"
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

// Criar um dataset com a proporção por município
collapse (mean) proportion_matched, by(municipio)

// Salvar o novo dataset
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_cognitivo_b.dta", replace






*********************** SUL


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2003_com_matched_cognitivo.dta", replace

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2003_com_matched_cognitivo.dta", clear 
 keep if empem3112 == "1"

// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)

collapse (mean) proportion_matched, by(municipio)







save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su03_prop_cognitivo_b.dta", replace











*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2004_com_matched_cognitivo.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co04_prop_cognitivo_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2004_com_matched_cognitivo.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne04_prop_cognitivo_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2004_com_matched_cognitivo.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)


collapse (mean) proportion_matched, by(municipio)






save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no04_prop_cognitivo_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2004_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se04_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2004_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su04_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co05_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne05_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no05_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se05_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2005_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su05_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co06_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne06_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no06_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se06_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2006_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su06_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co07_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne07_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no07_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se07_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2007_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su07_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co08_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne08_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no08_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se08_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2008_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su08_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co09_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne09_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no09_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se09_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2009_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su09_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co10_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne10_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no10_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se10_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2010_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su10_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co11_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne11_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no11_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se11_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2011_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su11_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co12_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne12_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no12_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se12_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2012_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su12_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co13_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne13_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no13_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se13_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2013_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su13_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co14_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne14_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no14_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se14_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2014_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su14_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co15_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne15_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no15_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se15_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2015_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su15_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co16_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne16_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no16_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se16_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2016_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su16_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co17_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne17_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no17_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se17_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2017_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su17_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co18_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne18_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no18_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se18_prop_cognitivo_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2018_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su18_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co19_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne19_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no19_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj19_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp19_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2019_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su19_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co20_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne20_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no20_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj20_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp20_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2020_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su20_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co21_prop_cognitivo_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne21_prop_cognitivo_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no21_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj21_prop_cognitivo_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 
 


 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp21_prop_cognitivo_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset cognitivo (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\cognitivo_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2021_com_matched_cognitivo.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 

collapse (mean) proportion_matched, by(municipio)

 

 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su21_prop_cognitivo_b.dta", replace
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
































// Carregar o dataset social
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta", replace


***********************
// Carregar o dataset social copia
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social - Copia.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

*duplicates drop ocup2002, force
*tostring ocup2002, replace
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais *skills\ranking\terciario\social_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2003_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co03_prop_social_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2003_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne03_prop_social_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2003_com_matched_social.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no03_prop_social_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2003_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2003_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su03_prop_social_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2004_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co04_prop_social_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2004_com_matched_social.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne04_prop_social_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2004_com_matched_social.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no04_prop_social_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2004_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se04_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2004_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su04_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co05_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne05_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no05_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se05_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2005_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su05_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co06_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne06_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no06_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se06_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2006_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su06_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co07_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne07_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no07_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se07_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2007_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su07_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co08_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne08_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no08_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se08_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2008_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su08_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co09_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne09_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no09_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se09_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2009_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su09_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co10_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne10_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no10_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se10_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2010_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su10_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) form at(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co11_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne11_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no11_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se11_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2011_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su11_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co12_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne12_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no12_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se12_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2012_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su12_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co13_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne13_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no13_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se13_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2013_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su13_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co14_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne14_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no14_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se14_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2014_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su14_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co15_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne15_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no15_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se15_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2015_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su15_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co16_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne16_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no16_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se16_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2016_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su16_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co17_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne17_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no17_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se17_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2017_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su17_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co18_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne18_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no18_prop_social_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se18_prop_social_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2018_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su18_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co19_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne19_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no19_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj19_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp19_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2019_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su19_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co20_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne20_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no20_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj20_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp20_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2020_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su20_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co21_prop_social_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne21_prop_social_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no21_prop_social_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj21_prop_social_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp21_prop_social_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset social (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\social_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2021_com_matched_social.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su21_prop_social_b.dta", replace
 
 
 
 
 
 
 
 
 
 














// Carregar o dataset motor
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

*duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta", replace


***********************
// Carregar o dataset motor copia
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor - Copia.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

*duplicates drop ocup2002, force
*tostring ocup2002, replace
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais *skills\ranking\terciario\motor_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2003_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co03_prop_motor_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2003_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne03_prop_motor_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2003_com_matched_motor.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no03_prop_motor_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2003_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2003_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su03_prop_motor_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2004_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co04_prop_motor_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2004_com_matched_motor.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne04_prop_motor_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2004_com_matched_motor.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no04_prop_motor_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2004_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se04_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2004_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su04_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co05_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne05_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no05_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se05_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2005_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su05_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co06_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne06_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no06_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se06_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2006_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su06_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co07_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne07_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no07_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se07_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2007_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su07_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co08_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne08_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no08_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se08_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2008_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su08_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co09_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne09_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no09_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se09_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2009_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su09_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co10_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne10_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no10_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se10_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2010_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su10_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co11_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne11_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no11_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se11_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2011_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su11_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co12_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne12_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no12_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se12_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2012_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su12_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co13_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne13_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no13_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se13_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2013_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su13_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co14_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne14_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no14_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se14_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2014_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su14_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co15_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne15_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no15_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se15_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2015_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su15_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co16_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne16_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no16_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se16_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2016_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su16_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co17_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne17_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no17_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se17_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2017_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su17_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co18_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne18_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no18_prop_motor_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se18_prop_motor_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2018_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su18_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co19_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne19_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no19_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj19_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp19_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2019_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su19_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co20_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne20_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no20_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj20_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp20_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2020_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su20_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co21_prop_motor_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne21_prop_motor_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no21_prop_motor_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj21_prop_motor_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp21_prop_motor_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset motor (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\motor_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2021_com_matched_motor.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su21_prop_motor_b.dta", replace
 
 
 
 
 
 
 
 
 


























// Carregar o dataset media
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

duplicates drop ocup2002, force
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta", replace


***********************
// Carregar o dataset media copia
*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media - Copia.dta", clear 
 keep if empem3112 == "1"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl duplicatas na variável ocup2002
*duplicates report ocup2002

// Listar duplicatas, se houver
*duplicates list ocup2002

*duplicates drop ocup2002, force
*tostring ocup2002, replace
// Salvar o dataset sem duplicatas
*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais *skills\ranking\terciario\media_unique_copia.dta", replace





*************************** CENTROOESTE

// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2003_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co03_prop_media_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2003_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne03_prop_media_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2003_com_matched_media.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no03_prop_media_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2003_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se03_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co03
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2003_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su03_prop_media_b.dta", replace














*************************** CENTROOESTE

// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2004_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co04_prop_media_b.dta", replace



************************** NORDESTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2004_com_matched_media.dta", replace



// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne04_prop_media_b.dta", replace








************************** NORTE


// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"

keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge

// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)

// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2004_com_matched_media.dta", replace


// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)





collapse (mean) proportion_matched, by(municipio)



save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no04_prop_media_b.dta", replace







 
 
 
 
 
 
 
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2004_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se04_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co04
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2004_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su04_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co05_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne05_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no05_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se05_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co05
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2005_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su05_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co06_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne06_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no06_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se06_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co06
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2006_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su06_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co07_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne07_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no07_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se07_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co07
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2007_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su07_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co08_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne08_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no08_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se08_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co08
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2008_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su08_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co09_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne09_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no09_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se09_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co09
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2009_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su09_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co10_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne10_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no10_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se10_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co10
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2010_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su10_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co11_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne11_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no11_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se11_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co11
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2011_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su11_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co12_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne12_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no12_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se12_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co12
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2012_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su12_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co13_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne13_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no13_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se13_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co13
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2013_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su13_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co14_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne14_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no14_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se14_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co14
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2014_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su14_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co15_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne15_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no15_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se15_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co15
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2015_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su15_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co16_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne16_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no16_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se16_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co16
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2016_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su16_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co17_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne17_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no17_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se17_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co17
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2017_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su17_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co18_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne18_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no18_prop_media_b.dta", replace
 
 
 
 
 
************************** SUDESTE
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sudeste2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\se18_prop_media_b.dta", replace
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co18
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2018_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su18_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co19_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne19_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no19_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj19_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp19_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co19
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2019_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su19_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co20_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne20_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no20_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj20_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp20_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2020_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su20_prop_media_b.dta", replace
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*************************** CENTROOESTE
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\centrooeste2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\co21_prop_media_b.dta", replace
 
 
 
************************** NORDESTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\nordeste2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\ne21_prop_media_b.dta", replace
 
 
 
 
************************** NORTE
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\norte2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\no21_prop_media_b.dta", replace
 
 
 
 
 
************************** mgesrj
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\mgesrj21_prop_media_b.dta", replace
 
 
 
 
 
************************** sp
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)          	
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
 
collapse (mean) proportion_matched, by(municipio)

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sp21_prop_media_b.dta", replace
 
 
 
 
 
 
*********************** SUL
 
 
// Carregar o dataset mestre co20
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"
 
// Realizar o merge m:1 com o dataset media (sem duplicatas)
merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\media_unique_copia.dta"
 
keep if (substr(clascnae95, 1, 2) >= “50” & substr(clascnae95, 1, 2) <= “74”) | (substr(clascnae95, 1, 2) >= “76” & substr(clascnae95, 1, 2) <= “93”) | (substr(clascnae95, 1, 2) >= “96” & substr(clascnae95, 1, 2) <= “99”) // Verificar o resultado da mescl o resultado da mesclagem
tab _merge
 
// Criar uma variável indicando se houve correspondência
gen matched = (_merge == 3)
 
// Salvar o dataset com a variável de correspondência
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\sul2021_com_matched_media.dta", replace
 
 
// Calcular a proporção de correspondências para cada município
bysort municipio: egen total_ocup = count(ocup2002)
bysort municipio: egen matched_ocup = total(matched)
gen proportion_matched = matched_ocup / total_ocup
// Gerar a tabela de proporções por município
*table municipio, c(mean proportion_matched) format(%5.2f)
 



 
collapse (mean) proportion_matched, by(municipio)
 

 
save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ranking\terciario\su21_prop_media_b.dta", replace
 
 
 
 
 
 
 







use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
destring ncognitivo nsocial nmotor nmed, replace

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta", replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\stata\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co03.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2003_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no03.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne03.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2003_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se03.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2003_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su03.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co03.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no03.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne03.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se03.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su03.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_03.dta"

















*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co04.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2004_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no04.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne04.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2004_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se04.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2004_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su04.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co04.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no04.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne04.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se04.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su04.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_04.dta"



















*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
**destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2005_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co05.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2005_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no05.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2005_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne05.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2005_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se05.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2005_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su05.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co05.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no05.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne05.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se05.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su05.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_05.dta"






















*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
**destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2006_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co06.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2006_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no06.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2006_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne06.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2006_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se06.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2006_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su06.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co06.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no06.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne06.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se06.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su06.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_06.dta"










*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2007_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co07.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2007_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no07.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2007_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne07.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2007_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se07.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2007_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su07.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co07.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no07.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne07.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se07.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su07.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_07.dta"





*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2008_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co08.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2008_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no08.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2008_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne08.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2008_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se08.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2008_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su08.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co08.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no08.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne08.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se08.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su08.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_08.dta"










*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2009_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co09.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2009_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no09.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2009_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne09.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2009_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se09.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2009_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su09.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co09.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no09.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne09.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se09.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su09.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_09.dta"














*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2010_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co10.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2010_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no10.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2010_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne10.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2010_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se10.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2010_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo.dta"


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su10.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co10.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no10.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne10.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se10.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su10.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_10.dta"


























*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2011_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co11.dta", replace


************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2011_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no11.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2011_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne11.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2011_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se11.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2011_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”


keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed


save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su11.dta", replace


*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co11.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no11.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne11.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se11.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su11.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_11.dta"













use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2012_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co12.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2012_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no12.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2012_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne12.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2012_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se12.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2012_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su12.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co12.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no12.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne12.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se12.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su12.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_12.dta"














*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2013_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co13.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2013_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no13.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2013_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne13.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2013_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se13.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2013_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su13.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co13.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no13.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne13.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se13.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su13.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_13.dta"












*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2014_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co14.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2014_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no14.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2014_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne14.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2014_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se14.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2014_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su14.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co14.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no14.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne14.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se14.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su14.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_14.dta"









*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2015_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co15.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2015_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no15.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2015_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne15.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2015_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se15.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2015_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su15.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co15.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no15.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne15.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se15.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su15.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_15.dta"













*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2016_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co16.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2016_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no16.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2016_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne16.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2016_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se16.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2016_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su16.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co16.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no16.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne16.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se16.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su16.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_16.dta"








*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2017_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co17.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2017_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no17.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2017_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne17.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2017_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se17.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2017_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su17.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co17.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no17.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne17.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se17.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su17.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_17.dta"















*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2018_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co18.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2018_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no18.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2018_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne18.dta", replace

********************************************* SUDESTE
use "D:\Bases\MTE\Vinc\sudeste2018_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se18.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2018_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su18.dta", replace

*******************************************************
*******************************************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co18.dta", clear 
 keep if empem3112 == "1"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no18.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne18.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se18.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su18.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_18.dta"








*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2019_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co19.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2019_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no19.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2019_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne19.dta", replace

********************************************* SUDESTE
*use "D:\Bases\MTE\Vinc\sudeste2019_limpo.dta", clear 
 keep if empem3112 == "1"

*merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

*keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   *| substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   *| substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
*drop if missing(ncognitivo)

*egen media_ncognitivo = mean(ncognitivo), by(municipio)
*egen media_nsocial2 = mean(nsocial), by(municipio)
*egen media_nmotor = mean(nmotor), by(municipio)
*egen media_nmed = mean(nmed), by(municipio)
   
*bysort municipio: egen first_obs = min(_n)
*keep if _n == first_obs
*drop first_obs

*keep municipio ncognitivo nsocial nmotor nmed

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se19.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2019_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su19.dta", replace

*******************************************************
*******************************************************

*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co19.dta", clear 
 keep if empem3112 == "1"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no19.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne19.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se19.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su19.dta"

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_19.dta"














*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2020_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co20.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2020_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no20.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2020_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne20.dta", replace

********************************************* SUDESTE
*use "D:\Bases\MTE\Vinc\sudeste2020_limpo.dta", clear 
 keep if empem3112 == "1"

*merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

*keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   *| substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   *| substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
*drop if missing(ncognitivo)

*egen media_ncognitivo = mean(ncognitivo), by(municipio)
*egen media_nsocial2 = mean(nsocial), by(municipio)
*egen media_nmotor = mean(nmotor), by(municipio)
*egen media_nmed = mean(nmed), by(municipio)
   
*bysort municipio: egen first_obs = min(_n)
*keep if _n == first_obs
*drop first_obs

*keep municipio ncognitivo nsocial nmotor nmed

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se20.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2020_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su20.dta", replace

*******************************************************
*******************************************************

*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co20.dta", clear 
 keep if empem3112 == "1"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no20.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne20.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se20.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su20.dta"

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_20.dta"










*use “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”
*describe ncognitivo nsocial nmotor nmed
*destring ncognitivo nsocial nmotor nmed, replace

********** CENTROOESTE
use "D:\Bases\MTE\Vinc\centrooeste2021_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co21.dta", replace

************************************************** NORTE

use "D:\Bases\MTE\Vinc\norte2021_limpo.dta", clear 
 keep if empem3112 == "1"
	
merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no21.dta", replace

************************************************* NORDESTE

use "D:\Bases\MTE\Vinc\nordeste2021_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne21.dta", replace

********************************************* SUDESTE
*use "D:\Bases\MTE\Vinc\sudeste2021_limpo.dta", clear 
 keep if empem3112 == "1"

*merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

*keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
  * | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
 *  | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
*drop if missing(ncognitivo)

*egen media_ncognitivo = mean(ncognitivo), by(municipio)
*egen media_nsocial2 = mean(nsocial), by(municipio)
*egen media_nmotor = mean(nmotor), by(municipio)
*egen media_nmed = mean(nmed), by(municipio)
   
*bysort municipio: egen first_obs = min(_n)
*keep if _n == first_obs
*drop first_obs

*keep municipio ncognitivo nsocial nmotor nmed

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se21.dta", replace

********************************************* SUL
use "D:\Bases\MTE\Vinc\sul2021_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su21.dta", replace

*******************************************************
*******************************************************

*use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co21.dta", clear 
 keep if empem3112 == "1"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no21.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne21.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\se21.dta"
*append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su21.dta"

*save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_21.dta"
























**************************************** SUDESTE 19-21
****** sp

use "D:\Bases\MTE\Vinc\mgesrj2019_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj19.dta", replace

***********

use "D:\Bases\MTE\Vinc\mgesrj2020_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj20.dta", replace

***************

use "D:\Bases\MTE\Vinc\mgesrj2021_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj21.dta", replace











*********************** sp

use "D:\Bases\MTE\Vinc\sp2019_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp19.dta", replace


**********

use "D:\Bases\MTE\Vinc\sp2020_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp20.dta", replace

***************

use "D:\Bases\MTE\Vinc\sp2021_limpo.dta", clear 
 keep if empem3112 == "1"

merge m:1 ocup2002 using “D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\skills_cbo - Copia.dta”

keep if substr(clascnae95, 1, 2) >= "50" & substr(clascnae95, 1, 2) <= "74" ///
   | substr(clascnae95, 1, 2) >= "76" & substr(clascnae95, 1, 2) <= "93" ///
   | substr(clascnae95, 1, 2) >= "96" & substr(clascnae95, 1, 2) <= "99"
   
   
drop if missing(ncognitivo)

egen media_ncognitivo = mean(ncognitivo), by(municipio)
egen media_nsocial2 = mean(nsocial), by(municipio)
egen media_nmotor = mean(nmotor), by(municipio)
egen media_nmed = mean(nmed), by(municipio)
   
bysort municipio: egen first_obs = min(_n)
keep if _n == first_obs
drop first_obs

keep municipio ncognitivo nsocial nmotor nmed

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp21.dta", replace












**********************************************************


use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co19.dta", clear 
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no19.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne19.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj19.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp19.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su19.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_19.dta"

*******************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co20.dta", clear 
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no20.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne20.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj20.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp20.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su20.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_20.dta"



****************************

use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\co21.dta", clear 
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\no21.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\ne21.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\mgesrj21.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\sp21.dta"
append using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\su21.dta"

save "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_21.dta"



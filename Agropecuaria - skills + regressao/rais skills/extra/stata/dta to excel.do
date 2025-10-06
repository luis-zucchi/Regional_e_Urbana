use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_03.dta", clear

export excel using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_03.xlsx", replace


forval year = 3/21 {
    // Cria o ano no formato de dois dígitos, adicionando um zero à esquerda se necessário
    local year2d = `year'
    if `year' < 10 {
        local year2d = "0`year'"
    }
    
    local full_year = 2000 + `year'
    di "Processando o ano `full_year'"
    use "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\media_municip_`year2d'.dta", clear
    export excel using "D:\Pessoal\Luis_Souza\Agropecuaria\rais skills\final media\media_municip_`year2d'.xlsx", replace
}


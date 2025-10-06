


tipos <- c("cog", "soc", "mot", "med")

for(catg in 1:4){

for(j in 1:16){
  
  plana <- lista_final[[j]]
  
  for(i in 1:11){
    if(i == 1){
      stitch <- select(plana[[1]],catg)
    }
    else{
      stitch <- rbind(stitch, select(plana[[i]],catg))
    }
  }
  

  
  if(j == 1){
    finala <- stitch
  }
  else{
  finala <- cbind(finala, stitch)
  }
  
  }
  tipo <- paste0(tipos[catg], "terciario")
  assign(tipo, finala)
}






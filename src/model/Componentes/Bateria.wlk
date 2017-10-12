class Bateria {
	var kwActuales
	method disminuir(kw){
		if((kwActuales - kw) < 0){
			throw new Exception("Te quedaste sin POWER")
		}
		kwActuales -= kw
	
	}
} 
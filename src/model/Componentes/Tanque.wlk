class Tanque {
	var litrosDisponibles
	method disminuir(litros){
		if((litrosDisponibles - litros) < 0){
			throw new Exception("Te quedaste sin FUEL")
		}
		litrosDisponibles -= litros
	}
}
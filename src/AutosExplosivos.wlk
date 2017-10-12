/*
 * Requerimientos
 * 
 * Al andar, se disminuye tanta nafta como:
 * 		Kms/Velocidad
 * 
 * Las Ferraris andan a 120
 * Los Falcon a 100
 * Las camionetas a 15 veces la cantidad de asientos
 * 
 * Cuando el Falcon anda, disminuye 10Kw de bateria 
 * 
 * Si no hay nafta suficiente o no hay bateria no deberia poder hacerse lo que me piden
 * En el caso que no hay aceite le carcamos 10%
 * 
 */
class NotSuficienteNastaException   inherits Exception {}
class NotSuficienteBateriaException inherits Exception {}
class NotSuficienteAceiteException  inherits Exception {}

class Conductor {
	var auto
	var cantCargasBotella = 10
	
	method setAuto(_auto){
		auto = _auto
	}
	method viajar(kms){
		try {
			auto.encender()
			auto.andar(kms)
		} catch exepcion:NotSuficienteAceiteException{
			auto.cargarAceite(10)
			cantCargasBotella -= 1
		}	
	}
	
}

// Clase abstracta
class Vehiculo {
	var motor
	var tanque
	var bateria
	
	constructor(){
		motor     = new Motor()
		tanque    = new Tanque()
		bateria   = new Bateria()
	}
	
	// Metodo abstracto
	method velocidad()
	//
	
	method encender(){
		motor.chequearAceite()
		bateria.disminuir(1)
		tanque.disminuir(0.1)
	}
	method andar(kms){
		tanque.disminuir(kms/self.velocidad());
	}
}

class Ferrari inherits Vehiculo{
	constructor()=super()
	override method velocidad() = 120
}

class Falcon inherits Vehiculo{
	constructor()=super()
	
	override method andar(kms){
		super(kms)
		bateria.disminuir(10)
	}
}

class Camioneta inherits Vehiculo{
	var cantidadAsientos
	
	constructor(_cantidadAsientos)=super(){
		cantidadAsientos = _cantidadAsientos
	}
	override method velocidad() =  cantidadAsientos * 15
}


class Motor {
	var porcentajeAceite = 100
	method chequearAceite(){
		if (porcentajeAceite < 70){
			throw new NotSuficienteAceiteException();
		}
	}
}

class Tanque {
	var litrosDisponibles
	method disminuir(litros){
		if(litrosDisponibles < litros){
			throw new NotSuficienteNastaException()
		}
		litrosDisponibles -= litros
	}
}

class Bateria {
	var kwActuales
	method disminuir(kw){
		if((kwActuales - kw) < 0){
			throw new NotSuficienteBateriaException()
		}
		kwActuales -= kw
	
	}
} 



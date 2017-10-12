import model.Componentes.Bateria.*
import model.Componentes.Tanque.*
import model.Componentes.Motor.*

class AbstractVehiculo {
	var motor
	var tanque
	var bateria
	
	constructor(){
		motor     = new Motor()
		tanque    = new Tanque()
		bateria   = new Bateria()
	}
	
	method velocidad()
	
	method encender(){
		bateria.disminuir(1)
		tanque.disminuir(0.1)
		motor.chequearAceite()
	}
	method andar(kms){
		tanque.disminuir(kms/self.velocidad());
	}
}

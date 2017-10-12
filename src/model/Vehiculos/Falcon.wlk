import model.Vehiculos.AbstractVehiculo.*

class Falcon inherits AbstractVehiculo{
	constructor()=super()
	override method andar(kms){
		bateria.disminuir(10)
		super(kms)
	}
}
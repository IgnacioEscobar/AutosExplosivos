import model.Vehiculos.AbstractVehiculo.*

class Camioneta inherits AbstractVehiculo{
	var cantidadAsientos
	
	constructor(_cantidadAsientos)=super(){
		cantidadAsientos = _cantidadAsientos
	}
	override method velocidad() =  cantidadAsientos * 15
}
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
  method peso(kilogramos) {return kilogramos}
  method nivelPeligrosidad() {return 1 }
}

object bumblebee {
  var estado = "auto"

  method esAuto() {return estado == "auto"}
  
  method transformarse() {
	if(self.esAuto()){
		estado = "robot"
	}
  }

  method peso() { return 800 }
  method nivelPeligrosidad() { 
	if(self.esAuto()){
	    return 15
	} else{
		return 30
	}
   }
}

object paqueteDeLadrillos {
  method peso(cantidad) { return cantidad * 2}
  method nivelPeligrosidad() { return 2 }
}

object bateriaAntiaerea {
	var property tieneMisiles = false

	method cargarMisiles() { self.tieneMisiles(true) }

	method peso() { return if (tieneMisiles) 300 else 200 }
	method peligrosidad() {	return if (tieneMisiles) 100 else 0 }
}

object residuosRadioactivos {
  method peso(kilogramos) {return kilogramos}
  method nivelPeligrosidad() {return 200 }
}
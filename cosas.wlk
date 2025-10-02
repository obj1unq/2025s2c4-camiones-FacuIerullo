object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
  var property kilogramos = 1

  method peso() { return kilogramos }
  method nivelPeligrosidad() { return 1 }
}

object bumblebee {
  var estado = "auto"

  method esAuto() { return estado == "auto" }
  
  method transformarse() {
	if(self.esAuto()){
		estado = "robot"
	}
  }

  method peso() { return 800 }
  method nivelPeligrosidad() { return if(self.esAuto()) 15 else 30 }
}

object paqueteDeLadrillos {
  var property cantidad = 1
  method peso() { return cantidad * 2}
  method nivelPeligrosidad() { return 2 }
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method cargarMisiles() {
		tieneMisiles = true
	}

	method peso() { return if (tieneMisiles) 300 else 200 }
	method nivelPeligrosidad() {	return if (tieneMisiles) 100 else 0 }
}

object residuosRadioactivos {
  var property kilogramos = 1
  method peso() { return kilogramos }
  method nivelPeligrosidad() { return 200 }
}

object contenedorPortuario {
  var property cosas = #{}

  method pesoTotalDeCosas(){
	var suma = 0
	cosas.forEach({cosas => suma = suma + cosas.peso()})
	return suma
  }

  method peso() {return 100 + self.pesoTotalDeCosas()}
  method nivelPeligrosidad(){
    const cosasPeligrosidad = cosas.map({cosa => cosa.nivelPeligrosidad()})
    return if(cosas.size() >= 1)cosasPeligrosidad.max() else 0
  }
}

object embalajeDeSeguridad {
	var cosaEmbalada = null
  
  method embalar(cosa) {
	cosaEmbalada = cosa
  }

  method peso(){ return cosaEmbalada.peso()}
  method nivelPeligrosidad(){ return cosaEmbalada.nivelPeligrosidad() / 2}
}
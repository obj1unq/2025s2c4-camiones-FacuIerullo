object knightRider {
  method bulto() { return 1 }
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
  method accidente() { }
}

object arenaAGranel {
  var property kilogramos = 1

  method bulto() { return 1 }
  method peso() { return kilogramos }
  method nivelPeligrosidad() { return 1 }
  method accidente() { kilogramos = kilogramos + 20  }
}

object bumblebee {
  var estado = "auto"

  method esAuto() { return estado == "auto" }
  
  method transformarse() {
	if(self.esAuto()){
		estado = "robot"
	} else{
    estado = "auto"
  }
  }
  method bulto() { return 2 }
  method peso() { return 800 }
  method nivelPeligrosidad() { return if(self.esAuto()) 15 else 30 }
  method accidente() { self.transformarse() }
}

object paqueteDeLadrillos {
  var property cantidad = 1

  method bulto(){ return if(cantidad < 100) 1 else if(cantidad > 100 && cantidad < 300) 2 else 3}
  method peso() { return cantidad * 2}
  method nivelPeligrosidad() { return 2 }
  method accidente(){
    if(cantidad > 12){
      cantidad = cantidad - 12
    } else{
      cantidad = 0
    }
  }
}

object bateriaAntiaerea {
	var property tieneMisiles = false

	method cargarMisiles() {
		tieneMisiles = true
	}

  method bulto(){ return if(tieneMisiles) 2 else 1}
	method peso() { return if (tieneMisiles) 300 else 200 }
	method nivelPeligrosidad() {	return if (tieneMisiles) 100 else 0 }
  method accidente() { tieneMisiles = false }
}

object residuosRadioactivos {
  var property kilogramos = 1
  method bulto() { return 1 }
  method peso() { return kilogramos }
  method nivelPeligrosidad() { return 200 }
  method accidente(){ kilogramos = kilogramos + 15}
}

object contenedorPortuario {
  var property cosas = #{}

  method pesoTotalDeCosas(){ return cosas.sum({ cosa => cosa.peso() }) }

  method bulto(){ return cosas.sum({ cosa => cosa.bulto() }) + 1}
  method peso() {return 100 + self.pesoTotalDeCosas()}
  method nivelPeligrosidad(){
    const cosasPeligrosidad = cosas.map({cosa => cosa.nivelPeligrosidad()})
    return if(cosas.size() >= 1)cosasPeligrosidad.max() else 0
  }
  method accidente(){
    return cosas.forEach( {cosa => cosa.accidente()} )
  }
}

object embalajeDeSeguridad {
  const property bulto = 2
	var cosaEmbalada = null
  
  method embalar(cosa) {
	cosaEmbalada = cosa
  }

  method peso(){ return cosaEmbalada.peso()}
  method nivelPeligrosidad(){ return cosaEmbalada.nivelPeligrosidad() / 2}
  method accidente(){}
}
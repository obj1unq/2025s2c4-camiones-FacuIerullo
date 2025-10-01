import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
		
	method cargar(unaCosa) {
		if(!cosas.contains(unaCosa)){
		cosas.add(unaCosa)
		} else{
			self.error("ya está cargado")
		}
	}

	method descargar(unaCosa) {
		if(cosas.contains(unaCosa)){
		cosas.remove(unaCosa)
		} else{
			self.error("no se encuentra en el camión")
		}
	}

	method esPar() {
		return cosas.all({ cosa => cosa.peso().even() })
	}

	method hayAlgoQuePese(cantidad){
		return cosas.any({ cosa => cosa.peso() == cantidad})
	}

	method pesoTotal(){
		var suma = 0
		cosas.forEach({ cosa => suma = suma + cosa.peso()})
		return suma + tara
	}

	method estaDentroDelLimiteDePeso(){
		return self.pesoTotal() < 2500
	}

	method encontrarAlgoConPeligrosidad(nivel){
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method cosasQueSuperenNivelDePeligrosidad(nivel){
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method cosasMasPeligrosasQue(cosa){
		return self.cosasQueSuperenNivelDePeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaConNivel(nivel) {
	  return self.estaDentroDelLimiteDePeso() && (self.cosasQueSuperenNivelDePeligrosidad(nivel) == #{})
	}
}

import cosas.*
import destinos.*
import rutas.*



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
		const suma = cosas.sum({ cosa => cosa.peso()})
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

	method hayAlgoQuePesaEntre(minimo, maximo) {
	  return cosas.any({ cosa => (cosa.peso() > minimo && cosa.peso() < maximo) })
	}

	method laCosaMasPesada(){
		const pesos = cosas.map({ cosa => cosa.nivelPeligrosidad() })
		const pesoMaximo = pesos.max()
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == pesoMaximo })
	}

	method pesosDeLaCarga(){
		return cosas.map({ cosa => cosa.peso()}).asSet()
	}

	method bultosDeLaCarga(){
		return cosas.sum({ cosa => cosa.bulto() })
	}

	method accidente(){
		return cosas.forEach({ cosa => cosa.accidente()})
	}

	method transportar(destino, camino){
		if(camino.requerimiento(self)){
			destino.descargarCamion(self)
			cosas.clear()
		}
	}
}

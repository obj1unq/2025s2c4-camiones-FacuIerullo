import cosas.*

object camion {
	const property cosas = #{}
		
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
}

object ruta9 {
  method requerimiento(camion) { return camion.puedeCircularEnRutaConNivel(20) }
}

object caminosVecinales {
  var property pesoMaximo = null

  method requerimiento(camion) {return camion.pesoTotal() < pesoMaximo}
}


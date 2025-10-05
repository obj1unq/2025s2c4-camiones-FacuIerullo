object almacen {
  var property cosas = #{}

  method descargarCamion(camion){
    cosas = #{cosas, camion.cosas()}.flatten().asSet()
  }
}


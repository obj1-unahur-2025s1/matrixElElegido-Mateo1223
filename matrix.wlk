import wollok.mirror.*
object nave {
  const pasajeros = [neo, morfeo, trinity]

  method chocar() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }

  method acelerar() {
    self.pasajerosSinElegido().forEach({p => p.saltar()})
  }

  method cantPasajeros() = pasajeros.size()
  method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
  method pasajeroDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
  method estaEquilibrada() = (self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2)
  method estaElElegido() = pasajeros.any({p => p.esElElegido()})
  method pasajerosSinElegido() = pasajeros.filter({p => !p.esElElegido()})

}

object neo {
  var energia = 100
  
  method saltar() {
    energia *= 0.5
  }

  method vitalidad() = energia * 0.1
  method esElElegido() = true
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  
  method saltar() {
    vitalidad = (vitalidad - 1).max(0) // 0.max(vitalidad - 1)
    estaCansado = !estaCansado
  }

  method vitalidad() = vitalidad
  method esElElegido() = false
}

object trinity {
  method saltar() {} // no hace nada
  method vitalidad() = 0
  method esElElegido() = false
}

# Unidades de prueba. La gem no define unidades propias: cada aplicación crea las suyas.
Metro = Medidas::UnidadBase.new("Metro", "m")
Centimetro = Metro.derivar("Centímetro", "cm", 0.01)
Milimetro = Metro.derivar("Milímetro", "mm", 0.001)
Kilometro = Metro.derivar("Kilómetro", "km", 1000)

Kilogramo = Medidas::UnidadBase.new("Kilogramo", "kg")
Gramo = Kilogramo.derivar("Gramo", "g", 0.001)

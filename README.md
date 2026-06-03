# Medidas

Modelo de medidas con unidades y conversiones entre magnitudes.

## Instalación

```ruby
gem "medidas", github: "wenoa/ruby-medidas"
```

## Uso

```ruby
require "medidas"

# La gem no define unidades: cada aplicación crea las que necesita.
Metro = Medidas::UnidadBase.new("Metro", "m")
Milimetro = Metro.derivar("Milímetro", "mm", 0.001)
Kilogramo = Medidas::UnidadBase.new("Kilogramo", "kg")

1 * Metro == 1000 * Milimetro          # => true
(1 * Metro) + (1 * Milimetro)          # => 1.001 m
(2 * Metro) * (3 * (Kilogramo / Metro)) # => 6 kg
(1.2 * Milimetro).to_s                 # => "1.2 mm"
```

### Integración con Mongoid

```ruby
require "medidas/mongoid"

field :peso, type: Medidas::Medida
```

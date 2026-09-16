module Medidas
  class Unidad
    @@instances = [] # steep:ignore UnannotatedEmptyCollection

    def self.simbolizada_como(simbolo)
      @@instances.detect { |unidad| unidad.simbolizada_como? simbolo }
    end

    attr_reader :nombre, :simbolo

    def initialize(nombre, simbolo)
      @nombre = nombre
      @simbolo = simbolo
      @@instances.push self
    end

    def simbolizada_como?(simbolo)
      @simbolo == simbolo
    end

    def misma_magnitud?(otra)
      unidad_base == otra.unidad_base
    end

    def exportar
      {
        nombre:,
        simbolo:,
      }
    end

    def coerce(otro)
      [self, otro]
    end

    # Se implementa para ser compatible con `Range#*` de la gema extensions.
    def adapt_to_range(rango)
      Range.new(rango.begin * self, rango.end * self, rango.exclude_end?)
    end
  end
end

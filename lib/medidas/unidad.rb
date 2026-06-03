module Medidas
  class Unidad
    @@instances = []

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
  end
end

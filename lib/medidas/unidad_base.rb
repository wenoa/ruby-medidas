module Medidas
  class UnidadBase < UnidadSimple
    def convertir_cantidad_a_unidad_base(cantidad)
      cantidad
    end

    def convertir_cantidad_desde_unidad_base(cantidad)
      cantidad
    end

    def derivar(nombre, simbolo, factor)
      UnidadDerivada.new(nombre, simbolo, self, factor)
    end

    def unidad_base
      self
    end
  end
end

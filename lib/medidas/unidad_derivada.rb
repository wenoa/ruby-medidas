module Medidas
  class UnidadDerivada < UnidadSimple
    def initialize(nombre, simbolo, unidad_base, factor)
      super(nombre, simbolo)
      @factor = factor.to_d
      @unidad_base = unidad_base
    end

    def convertir_cantidad_a_unidad_base(cantidad)
      cantidad * @factor
    end

    def convertir_cantidad_desde_unidad_base(cantidad)
      cantidad / @factor
    end

    attr_reader :unidad_base
  end
end

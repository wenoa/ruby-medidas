module Medidas
  class UnidadSimple < Unidad
    def *(cantidad_o_unidad)
      return Medida.new(cantidad_o_unidad, self) if cantidad_o_unidad.is_a? Numeric

      cantidad_o_unidad.multiplicar_por_unidad_simple(self)
    end

    def /(otra)
      UnidadDividida.a_partir_de(self, otra)
    end
  end
end

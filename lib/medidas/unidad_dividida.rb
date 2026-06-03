module Medidas
  class UnidadDividida < Unidad
    def self.a_partir_de(nominador, denominador)
      nombre = "#{nominador.nombre} por #{denominador.nombre}"
      simbolo = "#{nominador.simbolo}/#{denominador.simbolo}"
      new nombre, simbolo, nominador, denominador
    end

    def initialize(nombre, simbolo, nominador, denominador)
      super(nombre, simbolo)
      @nominador = nominador
      @denominador = denominador
    end

    def *(cantidad)
      Medida.new cantidad, self
    end

    def convertir_cantidad_a_unidad_base(cantidad)
      cantidad_en_unidad_base_del_nominador = @nominador.convertir_cantidad_a_unidad_base(cantidad)
      @denominador.convertir_cantidad_desde_unidad_base(cantidad_en_unidad_base_del_nominador)
    end

    def unidad_base
      @nominador.unidad_base / @denominador.unidad_base
    end

    def multiplicar_por_unidad_simple(_una_unidad_simple)
      @nominador
    end

    protected

    attr_reader :nominador, :denominador
  end
end

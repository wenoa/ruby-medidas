module Medidas
  class Medida
    MAGNITUDES_DISTINTAS = "Las magnitudes de las medidas deben ser iguales".freeze

    def initialize(cantidad, unidad)
      @cantidad = cantidad.to_d
      @unidad = unidad
    end

    def ==(otra)
      otra.is_a?(Medida) and
        @unidad.misma_magnitud?(otra.unidad) and
        en_unidad_base.cantidad == otra.en_unidad_base.cantidad
    end

    def <=(otro)
      return cantidad <= 0 if otro.zero?

      otro >= self
    end

    def >=(otro)
      en_unidad_base.cantidad >= otro.en_unidad_base.cantidad
    end

    def >(otro)
      otro < en_unidad_base.cantidad
    end

    def <(otro)
      otro > en_unidad_base.cantidad
    end

    def <=>(otra)
      en_unidad_base.cantidad <=> otra.en_unidad_base.cantidad
    end

    def +(otra)
      return self if otra.zero?
      raise Error, MAGNITUDES_DISTINTAS unless @unidad.misma_magnitud?(otra.unidad)

      @unidad.convertir_cantidad_desde_unidad_base(en_unidad_base.cantidad + otra.en_unidad_base.cantidad) * @unidad
    end

    def -(otra)
      return self if otra.zero?

      @unidad.convertir_cantidad_desde_unidad_base(en_unidad_base.cantidad - otra.en_unidad_base.cantidad) * @unidad
    end

    def *(otra)
      return (cantidad * otra) * @unidad if otra.is_a?(Numeric)

      medida_izquierda = en_unidad_base
      medida_derecha = otra.en_unidad_base
      cantidad = medida_izquierda.cantidad * medida_derecha.cantidad
      unidad = medida_izquierda.unidad * medida_derecha.unidad
      cantidad * unidad
    end

    def between?(a, b)
      (a..b).cover? self
    end

    def infinity?
      cantidad == BigDecimal::INFINITY
    end

    def proyectar(cantidad)
      cantidad * @unidad
    end

    def desproyectar
      cantidad.to_f
    end

    def to_s
      "#{format('%g', cantidad)} #{@unidad.simbolo}"
    end

    def zero?
      @cantidad.zero?
    end

    def positive?
      cantidad.positive?
    end

    def exportar
      {
        cantidad: cantidad.to_f,
        unidad: @unidad.exportar,
      }
    end

    protected

    def en_unidad_base
      @unidad.convertir_cantidad_a_unidad_base(@cantidad) * @unidad.unidad_base
    end

    attr_reader :cantidad, :unidad
  end
end

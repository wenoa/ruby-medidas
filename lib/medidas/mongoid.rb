require_relative "../medidas"

module Medidas
  class Medida
    class << self
      def mongoize(medida)
        {
          cantidad: medida.instance_variable_get(:@cantidad),
          unidad: medida.instance_variable_get(:@unidad).simbolo,
        }
      end

      def demongoize(medida)
        medida[:cantidad] * Unidad.simbolizada_como(medida[:unidad])
      end

      def evolve(object)
        return object unless object.is_a? Medida

        mongoize(object)
      end
    end
  end
end

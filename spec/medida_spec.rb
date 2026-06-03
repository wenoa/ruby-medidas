RSpec.describe(Medidas::Medida) {
  context("between?") {
    it("indica si la medida está dentro de un rango") {
      expect((50 * Centimetro).between?(0 * Metro, 1 * Metro)).to be(true)
      expect((150 * Centimetro).between?(0 * Metro, 1 * Metro)).to be(false)
    }
  }

  context("infinity?") {
    it("indica si la medida es infinita") {
      expect((BigDecimal::INFINITY * Metro).infinity?).to be(true)
      expect((1 * Metro).infinity?).to be(false)
    }
  }

  context("positive?") {
    it("indica si la cantidad es positiva") {
      expect((1 * Metro).positive?).to be(true)
      expect((-1 * Metro).positive?).to be(false)
    }
  }

  context("exportar") {
    it("se exporta como un hash con la cantidad y la unidad") {
      expect((3 * Metro).exportar).to eq(
        cantidad: 3.0,
        unidad: { nombre: "Metro", simbolo: "m" },
      )
    }
  }
}

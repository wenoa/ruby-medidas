RSpec.describe("Soporte para Mongoid") {
  context("mongoize") {
    it("convierte una medida en un hash con cantidad y símbolo de unidad") {
      expect(Medidas::Medida.mongoize(3 * Metro)).to eq(cantidad: 3.to_d, unidad: "m")
      expect(Medidas::Medida.mongoize(1.5 * Milimetro)).to eq(cantidad: 1.5.to_d, unidad: "mm")
    }
  }

  context("demongoize") {
    it("reconstruye la medida a partir del hash persistido") {
      expect(Medidas::Medida.demongoize(cantidad: 3, unidad: "m")).to eq(3 * Metro)
      expect(Medidas::Medida.demongoize(cantidad: 1.5, unidad: "mm")).to eq(1.5 * Milimetro)
    }
  }

  context("evolve") {
    it("convierte una medida usando mongoize") {
      expect(Medidas::Medida.evolve(3 * Metro)).to eq(Medidas::Medida.mongoize(3 * Metro))
    }

    it("deja intacto cualquier objeto que no sea una medida") {
      expect(Medidas::Medida.evolve("cualquier cosa")).to eq("cualquier cosa")
    }
  }

  it("ida y vuelta preserva la medida") {
    medida = 1.5 * Milimetro

    expect(Medidas::Medida.demongoize(Medidas::Medida.mongoize(medida))).to eq(medida)
  }
}

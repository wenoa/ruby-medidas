RSpec.describe("Medidas") {
  it("se respetan las equivalencias entre medidas con diferentes unidades de la misma magnitud") {
    expect(1 * Metro).to eq(1 * Metro)
    expect(1 * Metro).not_to eq(2 * Metro)
    expect(1 * Metro).not_to eq(1 * Milimetro)
    expect(1 * Metro).to eq(1000 * Milimetro)
    expect(1 * Metro).to eq(0.001 * Kilometro)
    expect(1 * Kilometro).to eq(1000 * Metro)
  }

  it("dos medidas de igual cantidad pero diferente magnitud son diferentes") {
    expect(1 * Metro).not_to eq(1 * Kilogramo)
  }

  context("al sumar") {
    context("magnitudes similares") {
      it("se obtiene el resultado esperado") {
        expect((1 * Metro) + (1 * Metro)).to eq(2 * Metro)
        expect((1 * Metro) + (1 * Milimetro)).to eq(1.001 * Metro)

        expect((1 * Milimetro) + (1 * Metro)).to eq(1001 * Milimetro)
        expect((1 * Kilometro) + (1 * Metro)).to eq(1.001 * Kilometro)
      }
    }

    context("con cero") {
      it("devuelve la misma medida") {
        expect((1 * Metro) + 0).to eq(1 * Metro)
      }
    }

    context("magnitudes diferentes") {
      it("falla") {
        expect {
          (1 * Metro) + (1 * Kilogramo)
        }.to raise_error(Medidas::Error, Medidas::Medida::MAGNITUDES_DISTINTAS)
      }
    }
  }

  context("al restar") {
    context("magnitudes similares") {
      it("se obtiene el resultado esperado") {
        expect((0 * Metro) - (1 * Metro)).to eq(-1 * Metro)
        expect((1 * Metro) - (1 * Milimetro)).to eq(0.999 * Metro)

        expect((1 * Milimetro) - (1 * Metro)).to eq(-999 * Milimetro)
        expect((1 * Kilometro) - (1 * Metro)).to eq(0.999 * Kilometro)
      }
    }

    context("con cero") {
      it("devuelve la misma medida") {
        expect((1 * Metro) - 0).to eq(1 * Metro)
      }
    }
  }

  context("al multiplicar") {
    context("magnitudes de unidad simple con magnitudes de unidad dividida") {
      it("se obtiene el resultado esperado") {
        expect((2 * Metro) * (3 * (Kilogramo / Metro))).to eq(6 * Kilogramo)
        expect((2 * Metro) * (3000 * (Gramo / Metro))).to eq(6 * Kilogramo)
        expect((3000 * Milimetro) * (2 * (Kilogramo / Metro))).to eq(6 * Kilogramo)
        expect((30 * Centimetro) * (2 * (Gramo / Centimetro))).to eq(60 * Gramo) # Denominador con unidad derivada
      }
    }

    context("por un escalar") {
      it("escala la cantidad y conserva la unidad") {
        expect((2 * Metro) * 3).to eq(6 * Metro)
      }
    }
  }

  context("proyección") {
    it("se puede proyectar su unidad") {
      expect((3 * Metro).proyectar(2)).to eq(2 * Metro)
    }

    it("se puede desproyectar") {
      expect((3 * Metro).desproyectar).to eq(3)
    }
  }

  context("relaciones") {
    it("mayor que") {
      expect(1 * Metro > 99 * Centimetro).to be(true)
      expect(1 * Metro > 100 * Centimetro).to be(false)
    }

    it("menor que") {
      expect(99 * Centimetro < 1 * Metro).to be(true)
      expect(100 * Centimetro < 1 * Metro).to be(false)
    }

    it("mayor o igual que") {
      expect(1 * Metro >= 100 * Centimetro).to be(true) # igual
      expect(1 * Metro >= 99 * Centimetro).to be(true) # mayor
      expect(1 * Metro >= 101 * Centimetro).to be(false) # menor
    }

    it("menor o igual que") {
      expect(100 * Centimetro <= 1 * Metro).to be(true) # igual
      expect(99 * Centimetro <= 1 * Metro).to be(true) # menor
      expect(101 * Centimetro <= 1 * Metro).to be(false) # mayor
    }

    it("menor o igual que cero") {
      expect(0 * Metro <= 0).to be(true) # igual
      expect(-1 * Metro <= 0).to be(true) # menor
      expect(1 * Metro <= 0).to be(false) # mayor
    }

    it("<=>") {
      expect(99 * Centimetro <=> 1 * Metro).to be(-1)
      expect(100 * Centimetro <=> 1 * Metro).to be(0)
      expect(101 * Centimetro <=> 1 * Metro).to be(1)
    }
  }

  context("representación") {
    it("String") {
      expect((1.2 * Centimetro).to_s).to eq("1.2 cm")
      expect((12 * Milimetro).to_s).to eq("12 mm")
    }
  }
}

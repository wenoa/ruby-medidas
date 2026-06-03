require_relative "lib/medidas/version"

Gem::Specification.new { |spec|
  spec.name = "medidas"
  spec.version = Medidas::VERSION
  spec.authors = ["Wenoa Studio"]
  spec.email = ["desarrollo@wenoa.studio"]

  spec.summary = "Modelo de medidas con unidades y conversiones entre magnitudes."
  spec.description = spec.summary
  spec.homepage = "https://github.com/wenoa/ruby-medidas"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_dependency "bigdecimal", ">= 3.1"
}

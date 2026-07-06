require "simplecov"
require "simplecov-console"

if ENV["COVERAGE"]
  SimpleCov.start {
    enable_coverage(:branch)
  }
end

require_relative "../lib/medidas"
require_relative "../lib/medidas/mongoid"
require_relative "support/unidades"

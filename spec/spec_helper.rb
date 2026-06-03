require "simplecov"
require "simplecov-console"

SimpleCov.start if ENV["COVERAGE"]

require_relative "../lib/medidas"
require_relative "../lib/medidas/mongoid"
require_relative "support/unidades"

require 'storks/version'
require 'storks/railtie' if defined?(Rails)

module Storks
  require 'storks/seed_type'

  def self.seed!(name)
    load SeedType.new(name).seed_rb
  end
end

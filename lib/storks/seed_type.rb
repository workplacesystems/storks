require 'pathname'

module Storks
  class SeedType

    def self.base_dir
      case
      when defined?(Rails)
        Rails.root
      when ENV.key?('STORKS_BASE_DIR')
        ENV['STORKS_BASE_DIR']
      else
         File.expand_path('../../../', __FILE__)
      end
    end

    def self.seeds_base_path
      Pathname.new(base_dir).join('db', 'seed_flavours')
    end

    attr_reader :name

    def initialize(name)
      fail(ArgumentError, 'name can not be blank') if !name || name == ''

      @name = name

      fail(ArgumentError,
           "Invalid seed #{name}.rb, must exist within #{self.class.seeds_base_path}"
          ) unless File.exist?(seed_rb)
    end

    def seed_rb
      self.class.seeds_base_path.join "#{name}.rb"
    end
  end
end

module Storks
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'storks/seed_with.task'
    end
  end
end

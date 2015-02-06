namespace :db do
  namespace :seed do
    desc 'Seed the database with a type of data'
    task :with, [:seed_type] => [:environment] do |_t, args|
      args.with_defaults seed_type: 'demo'
      Storks.seed!(args.seed_type)
    end
  end
end

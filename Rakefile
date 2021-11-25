require 'sequel'

task :migrate do
  Sequel.extension :migration

  database = Sequel.connect(ENV['DATABASE_URL'])
  Sequel::Migrator.run(database, 'db/migrations', :use_transaction => true)
end

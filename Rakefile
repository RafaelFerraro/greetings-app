require 'sequel'

task :greeting do
  p "Greetings!"
end

task :migrate do
  Sequel.extension :migration

  database = Sequel.connect(ENV['DATABASE_URL'])
  Sequel::Migrator.run(database, 'db/migrations', :use_transaction => true)
end

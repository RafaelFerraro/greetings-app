require 'sequel'

Sequel.migration do
  change do
    create_table(:greetings) do
      uuid :id, primary_key: true
      String :country, null: false
      String :greeting, null: false
    end
  end
end

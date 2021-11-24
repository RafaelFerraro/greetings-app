require 'sinatra'
require 'sequel'

get '/greetings' do
  'Hello!'
end

post '/greetings' do
  data = JSON.parse(request.body.read)

  DB = Sequel.connect(ENV['DATABASE_URL'])
  greetings = DB[:greetings]
  greetings.insert(:country => data["country"], :greeting => data["greeting"])

  "Greeting #{data["greeting"]} created for country #{data["country"]}"
end

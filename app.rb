require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/greetings' do
  greetings = DB[:greetings]

  return greetings.all.to_json unless params[:country]

  greeting = greetings.where(:country => params[:country]).first
  greeting ? greeting.to_json : "There isn't any greeting for this country"
end

post '/greetings' do
  data = JSON.parse(request.body.read)

  greetings = DB[:greetings]
  greetings.insert(:country => data["country"], :greeting => data["greeting"])

  "Greeting #{data["greeting"]} created for country #{data["country"]}"
end

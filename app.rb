require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

class Greeting < Sequel::Model(:greetings)
  plugin :uuid, :field => :id
  plugin :timestamps
end

get '/greetings' do
  return Greeting.all.map(&:values).to_json unless params[:country]

  greetings = Greeting.where(:country => params[:country])
  greetings.any? ? greetings.map(&:values).to_json : "There isn't any greeting for this country"
end

post '/greetings' do
  data = JSON.parse(request.body.read)

  created_greeting = Greeting.create(
    :country => data["country"],
    :greeting => data["greeting"]
  )

  "Greeting created: #{created_greeting.values}"
end

require 'sinatra'

get '/greetings' do
  'Hello!'
end

post '/greetings' do
  data = JSON.parse(request.body.read)
  country = data["country"]
  greeting = data["greeting"]

  "Greeting #{greeting} created for country #{country}"
end

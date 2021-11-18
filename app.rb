require 'sinatra'

get '/greetings' do
  'Hello!'
end

post '/greetings' do
  country = params.to_h[:country]
  greeting = params.to_h['greeting']

  puts params.to_h

  "Greeting #{greeting} created for country #{country}"
end

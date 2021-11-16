require 'sinatra'

get '/greetings' do
  'Hello!'
end

run Sinatra::Application

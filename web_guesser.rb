require 'sinatra'
require 'sinatra/reloader'


rando = rand(101)

get '/' do
  "The secret number is #{rando}".upcase
end


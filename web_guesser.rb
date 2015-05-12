require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)

def check_guess(guess_string)
  guess =  guess_string.to_i
  if guess > SECRET_NUMBER && (guess - SECRET_NUMBER) > 5
    mes = 'Way too high!'
    color = 'red'
  elsif guess < SECRET_NUMBER && (SECRET_NUMBER - guess > 5)
    mes = 'Way too low!'
    color = 'red'
  elsif guess > SECRET_NUMBER
    mes = 'too high!'
    color = 'palevioletred'
  elsif guess < SECRET_NUMBER
    mes = 'too low!'
    color = 'palevioletred'
  elsif guess == SECRET_NUMBER
    mes = 'You got it right!!'
    color = 'green'
  end
  [mes, color]
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message.first, :color => message.last}
end


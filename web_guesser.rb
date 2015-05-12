require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)

def check_guess(guess_string)
  guess =  guess_string.to_i
  color = 'palevioletred'
  if guess > SECRET_NUMBER
    mes = 'too high!'
  elsif guess < SECRET_NUMBER
    mes = 'too low!'
  elsif guess == SECRET_NUMBER
    mes = 'You got it right!!'
    color = 'green'
  end
  if diff(guess) > 5
    mes = 'way ' + mes
    color = 'red'
  end
  [mes, color]
end

def diff(num)
  (SECRET_NUMBER - num).abs
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message.first, :color => message.last}
end


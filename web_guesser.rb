require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)

def check_guess(guess_string)
  guess =  guess_string.to_i
  if guess > SECRET_NUMBER && (guess - SECRET_NUMBER) > 5
    message = 'Way too high!'
  elsif guess < SECRET_NUMBER && (SECRET_NUMBER - guess > 5)
    message = 'Way too low!'
  elsif guess > SECRET_NUMBER
    message = 'too high!'
  elsif guess < SECRET_NUMBER
    message = 'too low!'
  elsif guess == SECRET_NUMBER
    message = 'You got it right!!'
  end
  message
end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end


require 'sinatra/base'

class Battleships < Sinatra::Base
  enable :sessions
  get '/' do
    puts '==='*20
    puts session.inspect
    @coordinate = session[:coordinate]
    erb :battleships
  end

  get '/hit' do
    puts '***'*20
    puts session.inspect
    @coordinate = params[:coordinate]
    session[:coordinate] = @coordinate
    puts session.inspect
    erb :hit
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

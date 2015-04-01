require 'sinatra/base'

class Battleships < Sinatra::Base

  get '/' do
    erb :battleships
  end

  get '/hit' do
    @coordinate = params[:coordinate]
    erb :hit
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

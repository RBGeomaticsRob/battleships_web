require './lib/destroyer'
require './lib/player'
require 'sinatra/base'

class Battleships < Sinatra::Base
  enable :sessions
  get '/' do
    session[:player] ||= Player.new
    @player = session[:player]
    erb :battleships
  end

  post '/play' do
    session[:player].receive_hit(params[:coordinate])
    erb :play
  end

  post '/set_ship' do
    begin
      @location = params[:location]
      session[:player].place(Destroyer, @location, :south)
      erb :battleships
    rescue
      erb :collision
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

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

  get '/play' do
    player = session[:player]
    player.receive_hit(params[:coordinate])
    session[:player] = player
    erb :play
  end

  post '/set_ship' do
    begin
      @location = params[:location]
      @user = session[:player]
      @user.place(Destroyer, 'A1', :south)
      session[:player] = @user
      erb :play
    rescue
      erb :collision
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

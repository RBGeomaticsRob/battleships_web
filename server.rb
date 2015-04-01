require './lib/destroyer'
require './lib/player'
require 'sinatra/base'

class Battleships < Sinatra::Base
  enable :sessions
  get '/' do
    session[:player] ||= Player.new
    @player = session[:player]
    # puts '==='*20
    # puts session.inspect
    erb :battleships
  end

  get '/hit' do
    # puts '***'*20
    # puts session.inspect
    @coordinate = params[:coordinate]
    player = session[:player]
    player.receive_hit(@coordinate)
    session[:player] = player
    # puts session.inspect
    erb :hit
  end

  get '/set_ship' do
    begin
      @location = params[:location]
      @user = session[:player]
      @user.place(Destroyer, 'A1', :south)
      session[:player] = @user
      erb :hit
    rescue
      erb :collision
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

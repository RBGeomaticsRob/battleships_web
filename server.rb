require './lib/destroyer'
require './lib/player'
require 'sinatra/base'

class Battleships < Sinatra::Base

  @@player1 = Player.new
  @@player2 = Player.new
  @@player_counter = 0
  @@current_player = 1

  enable :sessions

  get '/' do
    if session[:player].nil?
      @@player_counter += 1
      session[:player] = @@player_counter
    end
    if session[:player] == 1
      @player = @@player1
      @other_player = @@player2
    else
      @player = @@player2
      @other_player = @@player1
    end
    puts "===" * 20
    puts session.inspect
    erb :battleships
  end

  post '/play' do
    puts session[:player]
    puts @@current_player
    if (session[:player] == 1) && (@@current_player == 1)
      @player = @@player1
      @other_player = @@player2
      @@player1.receive_hit(params[:coordinate])
      @@current_player = 2
      erb :play
    elsif (session[:player] == 2) && (@@current_player == 2)
      @player = @@player2
      @other_player = @@player1
      @@player2.receive_hit(params[:coordinate])
      @@current_player = 1
      erb :play
    else
      erb :wait
    end
  end

  post '/set_ship' do
    begin
      if session[:player] == 1
        @location = params[:location]
        @player = @@player1
        @@player2.place(Destroyer, @location, :south)
      else
        @location = params[:location]
        @player = @@player1
        @@player1.place(Destroyer, @location, :south)
      end
      puts "^^^" * 20
      puts session.inspect
      erb :battleships
    rescue
      puts "~~~" * 20
      puts session.inspect
      erb :collision
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

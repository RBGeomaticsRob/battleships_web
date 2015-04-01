require 'sinatra/base'

class Battleships < Sinatra::Base

  enable :sessions

  get '/' do
    puts "===" * 20
    puts session.inspect
    @name = session[:name]
    erb :battleships
  end

  post '/new_player' do
    puts "***" * 20
    puts session.inspect
    @name = params[:player_name]
    session[:name] = @name
    puts session.inspect
    erb :player
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra/base'

class Battleships < Sinatra::Base
  get '/' do
    erb :battleships
  end

  get '/hit' do
    @coordinate = params[:coordinate]
    "<div>
      Hello, it's a <%= @return %>!
    </div>"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

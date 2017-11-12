require 'sinatra/base'
require './lib/game'
require './lib/cpu'

class Rps < Sinatra::Base

  enable :sessions
  set :session_secret, "key"

  get '/' do
    erb(:index)
  end

  post '/name' do
    session[:player] = Game.new(params[:player])
    redirect "/play"
  end

  get '/play' do
    @game = session[:player]
    @display_winner = @game.start_game(session[:choice])
    erb(:play)
  end

  post '/game' do
    p session[:choice] = params[:choice]
    redirect "/play"
  end

end

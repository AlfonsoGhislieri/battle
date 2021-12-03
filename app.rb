require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
	enable :sessions
	
	configure :development do
		register Sinatra::Reloader
	end

	get '/' do
		erb :index	
	end

	post '/names' do
		$game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
		redirect '/play'
	end

	get '/play' do
		@player_1 = $game.players.first
		@player_2 = $game.players.last
		@current_turn = $game.current_turn
		@lost = $game.lost?(@current_turn)
		erb :play
	end

	post '/action' do
		@action = params[:attack]
		@current_turn = $game.current_turn
		$game.attack(@current_turn) if @action == "Attack"
		erb :action
	end

	run! if app_file == $0
end

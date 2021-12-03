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
		@action = params[:attacks]
		@current_turn = $game.current_turn
		@paralysed = @current_turn.paralysed
		$game.attack(@current_turn) if @action == "attack"
		$game.paralyse(@current_turn) if @action == "paralyse"
		erb :action
	end

	run! if app_file == $0
end

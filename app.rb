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
		$Player1 = Player.new(params[:player_1_name]) 
		$Player2 = Player.new(params[:player_2_name])
		redirect '/play'
	end

	get '/play' do
		@player_1 = $Player1
		@player_2 = $Player2
		erb :play
	end

	post '/action' do
		@player_1 = $Player1 
		@player_2 = $Player2
		@action = params[:attack]
		Game.new.attack(@player_2) if @action == "Attack"
		erb :action
	end

	run! if app_file == $0
end

require_relative 'player'

class Game
  attr_reader :players, :current_turn
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def attack(current_player)
    opponent(current_player).reduce_health
    switch_turns(current_player)
  end

  def lost?(current_player)
    current_player.health <= 0
  end

  private 

  def switch_turns(current_player)
    @current_turn = opponent(current_player)
  end
  
  def opponent(current_player)
    @players.select { |player| player != current_player }.first
  end
end
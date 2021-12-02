require_relative 'player'

class Game
  attr_reader :player1, :player2, :attacker, :defender
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @attacker = @player1
    @defender = @player2
  end

  def attack(attacker, defender)
    defender.reduce_health
    @attacker = defender
    @defender = attacker
  end
end
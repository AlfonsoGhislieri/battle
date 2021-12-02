require 'game'

describe Game do
  before do
    @player1 = double
    @player2 = double
    allow(@player2).to receive(:reduce_health).and_return(nil)
  end

  it "accepts two player instances" do
    game = Game.new(@player1, @player2)
    expect(game).to have_attributes(:player1 => @player1, :player2 => @player2)
  end

  it "Attack a player" do
    game = Game.new(@player1, @player2)
    expect(@player2).to receive(:reduce_health)
    game.attack(@player1, @player2)
  end

  it "changes defender after an attack" do
    game = Game.new(@player1, @player2)
    game.attack(@player1, @player2)
    expect(game.defender).to eq @player1
  end
end

require 'game'

describe Game do
  before do
    @player1 = double
    @player2 = double
    allow(@player2).to receive(:reduce_health).and_return(nil)
    allow(@player1).to receive(:paralysed).and_return(false)
    allow(@player1).to receive(:paralysed).and_return(false)
    @game = Game.new(@player1, @player2)
  end

  it "accepts two player instances" do
    expect(@game).to have_attributes(:players => [@player1, @player2])
  end

  it "Attack a player" do
    expect(@player2).to receive(:reduce_health)
    @game.attack(@player1)
  end

  it "changes defender after an attack" do
    @game.attack(@player1)
    expect(@game.current_turn).to eq @player2
  end

  it "#lost returns true if player has 0 or lower health" do
    allow(@player1).to receive(:health).and_return(0)
    expect(@game.lost?(@player1)).to eq true
  end
end

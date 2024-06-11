require_relative '../player'

describe Player do
	describe "#new" do
		context "with no parameters" do	
			  it "needs one argument to initialize" do
			  	expect { Player.new }.to raise_error(ArgumentError)
			  end
		end
		context "with valid parameters" do
			it "defaults player correctly" do
				player1 = Player.new(2)

				expect(player1.playerID).to eq(2)
				expect(player1.totalScore).to eq(0)
			end
		end
	end
end

require_relative '../game'

describe Game do
    before(:each) do
        @game1 = Game.new(2)
    end

    describe "#new" do
		context "with no parameters" do	
			  it "needs one argument to initialize" do
			  	expect { Game.new }.to raise_error(ArgumentError)
			  end
		end
		context "with valid parameters" do
			it "given proper number of players" do
				expect(@game1.players.size).to eq(2)
                expect(@game1.players[0]).to be_an_instance_of(Player)
				expect(@game1.players[1]).to be_an_instance_of(Player)
                expect(@game1.finalRound).to eq(false)
                expect(@game1.lastRound).to eq(false)
			end
		end

	end
	
	describe "#score" do
		context "passing triplets of 1" do
			it "verify if the score is 1000" do
				expect(@game1.score([1,1,1,2,4])).to eq(1000)
			end
		end
        context "passing triplets of 2" do
			it "verify if the score is 200" do
				expect(@game1.score([2,3,2,2])).to eq(200)
			end
        end   
        context "passing triplets of 3" do
			it "verify if the score is 300" do
				expect(@game1.score([3,3,2,3])).to eq(300)
			end
		end
        context "passing triplets of 4" do
			it "verify if the score is 400" do
				expect(@game1.score([4,4,4,3])).to eq(400)
			end
		end
        context "passing triplets of 5" do
			it "verify if the score is 500" do
				expect(@game1.score([5,3,5,5])).to eq(500)
			end
		end
        context "passing triplets of 6" do
			it "verify if the score is 600" do
				expect(@game1.score([6,6,2,6])).to eq(600)
			end
		end

        context "passing with only scoring dice as 1" do
			it "verify if the score is 100" do
				expect(@game1.score([2,3,4,1])).to eq(100)
			end
		end
        context "passing with only scoring dice as 5" do
			it "verify if the score is 50" do
				expect(@game1.score([2,3,6,5])).to eq(50)
			end
		end
        context "passing all non scoring dice" do
			it "verify if the score is 0" do
				expect(@game1.score([2,3,6,3])).to eq(0)
			end
		end
        context "passing triplets and individual scoring dices" do
			it "verify if the score is 350" do
				expect(@game1.score([2,2,2,5,1,3,4])).to eq(350)
			end
		end
	end
end

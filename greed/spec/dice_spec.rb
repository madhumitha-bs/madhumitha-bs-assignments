require_relative '../dice'

describe DiceSet do
	
	describe "#roll" do
		context "rolling 5 dices with parameter" do
			it "simulates rolling of 5 dices and a side from each dice" do
				roll1 = DiceSet.new
				roll1.roll(5)
				expect(roll1.values).to be_a_kind_of(Array)
				roll1.values.each do |value|
					expect(value).to be >= 1
					expect(value).to be <= 6
				end
			end
		end

	end
end

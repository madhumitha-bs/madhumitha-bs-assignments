class Player
    attr_accessor :playerID,  :totalScore
    def initialize(id)
        @playerID = id
        @totalScore = 0
    end    
end
# p = Player.new()
# puts p.playerID, p.totalScore

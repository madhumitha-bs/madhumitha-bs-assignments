require_relative 'player'
require_relative 'dice'

# def delete_first_occurrence(array, element)
#     index = array.index(element)
#     array.delete_at(index) if index
#     array
# end

class Game 
    attr_accessor :players, :finalRound, :lastRound
    def score(dice)
      counts = Hash.new(0)  # Initialize a hash with default value 0
      result = 0
    
      # Count the occurrences of each dice value
      dice.each { |value| counts[value] += 1 }
    
      # Calculate the score for three of a kind
      counts.each do |value, count|
        if count >= 3
          result += case value
                    when 1 then 1000
                    else value * 100
                    end
          counts[value] -= 3  # Remove three of a kind from count
        end
      end
    
      # Calculate the score for remaining 1s and 5s
      result += counts[1] * 100
      result += counts[5] * 50
    
      result
    end
    
    def initialize(numberOfPlayers)
        @players = []
        @finalRound = false
        @lastRound = false
        numberOfPlayers.times do |i| 
            @players << Player.new(i+1) #Players for the game are created
        end
    end    

    # Game Logic
    def start
        turn = 1
        dice = DiceSet.new

        while @finalRound == false || @lastRound==false 
            if @finalRound == true 
                @lastRound = true #to run one last turn for all players and exit the while loop
            end    
            puts "Turn #{turn}:"
            puts "--------"
            @players.size.times do |i| #To generate a turn for each player
              dice.roll(5)
              puts "Player #{players[i].playerID} rolls: #{dice.values}"
              tempScore = score(dice.values) #dice.values will only comtain non scoring values after calling score
              puts "Score in this round: #{tempScore}"
              puts "Total score: #{players[i].totalScore}"
              turnEnded = false 
              if tempScore == 0 #Current turn if end only of all the sides are non scoring
                  turnEnded = true
              end    
              while turnEnded == false #this loop is to prompt the player to roll for subsequent non scoring dices
                numberOfDiceToRoll = dice.values.size
                if numberOfDiceToRoll == 0  #If the player gets all scoring sides, he gets to roll all 5 again
                    numberOfDiceToRoll = 5
                end   
                puts "Do you want to roll the non-scoring #{numberOfDiceToRoll} dice? (y/n): "
                roll = gets().chomp()
                if roll == "y"
                    dice.roll(numberOfDiceToRoll)
                    tempScore2 = score(dice.values)
                    puts "Score in this round: #{tempScore2}"
                    if(tempScore2==0)
                        turnEnded = true #We are not adding the score to the player as he got all non scoring sides and he loses the turn
                    else
                        tempScore+=tempScore2    #tempScore2 -  the score of each chance | tempScore - score of each turn(Accumulated score)
                    end
                else
                    players[i].totalScore += tempScore
                    if players[i].totalScore>=3000 
                        @finalRound = true
                    end
                    turnEnded = true
                end
              end    
              puts "Total score: #{players[i].totalScore}"
            end    
            turn = turn + 1
            
            # puts "**********************************************"
            puts "\n"
        end
        @players.size.times do |i|
            puts "Player #{players[i].playerID}. Total score = #{players[i].totalScore}" 
        end
    end   
end    

if __FILE__ == $0 #this blocks is executed only when game.rb is called
  puts "Enter number of players: "
  Game.new(gets().chomp().to_i).start()
end

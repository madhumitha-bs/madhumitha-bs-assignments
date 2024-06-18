require_relative 'player'
require_relative 'dice'

def delete_first_occurrence(array, element)
    index = array.index(element)
    array.delete_at(index) if index
    array
end

class Game 
    attr_accessor :players, :finalRound, :lastRound
    def score(dice)
        # It calculates the score, when triplets, 1, 5 are encoutered, they are added added to score and removed from array. 
        # Non scoring values like 2, 3 are left out in the array 
        count1 = 0;
        count2 = 0;
        count3 = 0;
        count4 = 0;
        count5 = 0;
        count6 = 0;
        result = 0;
        for i in dice
          if(i==1)
            count1 = count1 + 1
          elsif(i==2)
            count2 = count2 + 1
          elsif(i==3)
            count3 = count3 + 1
          elsif(i==4)
            count4 = count4 + 1
          elsif(i==5)
            count5 = count5 + 1
          elsif(i==6)
            count6 = count6 + 1
          end
        end
        if(count1 >= 3) 
          result = result + 1000
          count1 = count1 - 3 #case Three 1s 
          delete_first_occurrence(dice,1) # Delete 1st occurance
          delete_first_occurrence(dice,1) # Delete 2nd occurance
          delete_first_occurrence(dice,1) # Delete 3rd occurance
        end
        if(count2 >= 3) 
          result = result + 200
          delete_first_occurrence(dice,2) # Delete 1st occurance
          delete_first_occurrence(dice,2) # Delete 2nd occurance
          delete_first_occurrence(dice,2) # Delete 3rd occurance
        end
        if(count3 >= 3)
          result = result + 300
          delete_first_occurrence(dice,3) # Delete 1st occurance
          delete_first_occurrence(dice,3) # Delete 2nd occurance
          delete_first_occurrence(dice,3) # Delete 3rd occurance
        end
        if(count4 >= 3)
          result = result + 400
          delete_first_occurrence(dice,4) # Delete 1st occurance
          delete_first_occurrence(dice,4) # Delete 2nd occurance
          delete_first_occurrence(dice,4) # Delete 3rd occurance
        end
        if(count5 >= 3)
          result = result + 500
          count5 = count5 - 3
          delete_first_occurrence(dice,5) # Delete 1st occurance
          delete_first_occurrence(dice,5) # Delete 2nd occurance
          delete_first_occurrence(dice,5) # Delete 3rd occurance
        end
        if(count6 >= 3)
          result = result + 600
          delete_first_occurrence(dice,6) # Delete 1st occurance
          delete_first_occurrence(dice,6) # Delete 2nd occurance
          delete_first_occurrence(dice,6) # Delete 3rd occurance
        end
      
        while(count1 != 0)
          result = result + 100
          count1 = count1 - 1
          delete_first_occurrence(dice,1) # Delete 1st occurance
        end
        while(count5 != 0)
          result = result + 50
          count5 = count5 - 1
          delete_first_occurrence(dice,5) # Delete 1st occurance
        end
        return result
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

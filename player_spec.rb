require_relative 'spec_helper'
require_relative 'game'
require_relative 'player'
require_relative 'treasure_trove'

describe Player do
    before do
        @initial_health = 150
        @player = Player.new("larry", @initial_health)
        $stdout = StringIO.new
    end

    it "has a capitalized name" do
        @player.name.should == "Larry"
    end

    it "has an initial health" do
        @player.health == 150
    end

    it "has a string representation" do
        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:hammer, 50))
        
        @player.to_s.should == "I'm Larry with a health = #{@initial_health}, points = 100, and score = 250."
    end

    it "computes a score as the sum of its health and length of name" do
        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:hammer, 50))
      
        @player.score.should == 250
    end

    it "increases health by 15 when w00ted" do
        @player.w00t
        @player.health.should == (@initial_health + 15)
    end
    it "decreases health by 10 when blammed" do
        @player.blam
        @player.health.should == (@initial_health - 10)
    end

    context "with a health of greater than 100" do
        before do                        
            @player = Player.new("larry", 150)
        end

        it "is strong" do
            @player.should be_strong
        end
    end

    context "with a health of less than 100" do
        before do
            @player = Player.new("larry", 90)
        end

        it "is wimpy" do
            @player.should_not be_strong
        end 
    end

    context "in a collection of players" do
        before do
          @player1 = Player.new("moe", 100)
          @player2 = Player.new("larry", 200)
          @player3 = Player.new("curly", 300)
      
          @players = [@player1, @player2, @player3]
        end
      
        it "is sorted by decreasing score" do
          @players.sort.should == [@player3, @player2, @player1]
        end
    end

    it "computes points as the sum of all treasure points" do
        @player.points.should == 0
      
        @player.found_treasure(Treasure.new(:hammer, 50))
      
        @player.points.should == 50
      
        @player.found_treasure(Treasure.new(:crowbar, 400))
      
        @player.points.should == 450
      
        @player.found_treasure(Treasure.new(:hammer, 50))
      
        @player.points.should == 500
      end

      it "assigns a treasure for points during a player's turn" do
        game = Game.new("Knuckleheads")
        player = Player.new("moe")
      
        game.add_player(player)
      
        game.play(1)
      
        player.points.should_not be_zero
      
        # or use alternate expectation syntax:
        # expect(player.points).not_to be_zero
      end
end
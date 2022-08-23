class Player
    attr_reader :health
    attr_accessor :name

    def name=(new_name)
        @name = new_name.capitalize
    end

    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def blam
        @health -= 10
        puts "#{@name} got blammed!"
    end

    def w00t
        @health += 15
        puts "#{@name} got w00ted!"
    end

    def score
        @health + @name.length
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}"
    end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player2.name = "lawrence"
player3 = Player.new("curly", 125)

players = [player1, player2, player3]
player4 = Player.new("shemp", 90)
players[2] = player4

puts "There are #{players.size} in the game:"
players.each do |player|
    player.blam
    player.w00t
    player.w00t
    puts player
end
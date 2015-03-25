class Deck
  SUIT = ['♠', '♥', '♦', '♣']
  RANK = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]

  def initialize(string)
    @name = string
    @collection = []

    SUITS.each do |suit|
      RANKS.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end
    @collection.shuffle!
  end

  def rank
    if @rank == "A"
      return 11
    elsif @rank.to_i == 0
      return 10
    else
      return @rank.to_i
    end
  end

  def deal(string)
    player = Hand.new(string)

    2.times do
      player << @collection.pop
    end

    puts "#{player.name} was dealt #{player.first}"
    puts "#{player.name} was dealt #{player.second}"
    puts "#{player.name} score: #{player.value}"

    if player.value == 21
      puts "#{player.name} wins!"
      exit
    end

    if player.name != "Dealer"
      while true
        prints "Hit or stand (H/S): "
        decision = gets.chomp.downcase
        if decision == "h"
          player << @collection.pop
          puts "#{pl}ayer.name} was dealt #{player.last}"
          puts "#{player.name} score: #{player.value}"
        elsif decision != "h" && decision != "s"
          puts "Try again"
          decision = gets.chomp.downcase
        else
          break
        end
        if player.value > 20
          puts "Busted!"
          exit
        elsif player.value == 21
          puts "#{player.name} wins!"
          exit
        end
      end
    else
      while player.value < 17
        player << @collection.pop
        puts "#{pl}ayer.name} was dealt #{player.last}"
        puts "#{player.name} score: #{player.value}"
      end
    end
  end
end

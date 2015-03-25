class Hand
  def initialize(string)
    @name = string
    @collection = []
  end

  def name
    "#{name}"
  end

  def value
    sum = 0
    ace_counter = 0
    @collection.each do |card|
      if card.rank == 11
        ace_counter += 1
      else
        sum += card.rank
      end
      if sum > 21 && ace_counter > 0
        sum -=10
      end
    end
    sum
  end

  def first
    @collection.first
  end

  def second
    @collection[1]
  end

  def last
    @collection.last
  end

  def <<(card)
    @collection << card
  end

end
#######
  # attr :hand, :name, :deck
  #
  # def initialize(name, deck)
  #   @name = name
  #   @deck = deck
  #   @hand = Array.new
  # end
  #
  # def deal(card)
  #   @hand << card
  # end
  #
  # def hand_score
  #   result = 0
  #   @hand.each {|card| result += card.value?(card).to_i}
  #   result
  # end
  #
  # def to_s
  #   result = ""
  #   @hand.each do |card|
  #     result += "#{name} was dealt #{card.rank} of #{card.suit}\n"
  #   end
  #   result
  # end
  #
  # # def begin
  # #   puts @name
  # #   puts "#{@name}'s hand score: #{@name.hand_score}"
  # #   puts
  # # end
  #
  # def prompt
  # result = "stand"
  # print "Hit or stand (H/S): "
  # choice = gets.chomp.downcase
  #   if choice == "hit" || choice == "h"
  #     new_card = deal(deck.draw).last
  #     puts "Player was dealt #{new_card.rank} of #{new_card.suit}\n"
  #     puts "Player's hand score: #{hand_score}"
  #   elsif choice == "s" || choice == "stand"
  #     result = "stand"
  #   else
  #     "Stop being a dick and use a letter"
  #   end
  #   puts
  # end
  #
  # def blackjack?
  #   if hand.length == 2 && hand_score == 21
  #     puts "Blackjack!"
  #     true
  #   end
  # end
  #
  # def bust?
  #   if hand_score > 21
  #     true
  #   end
  # end

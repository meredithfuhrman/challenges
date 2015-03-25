# SUIT = ['♠', '♥', '♦', '♣']
# RANK = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]

class Card

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank}#{suit}"
  end

end
  # attr_reader :suit, :rank
  #
  # def initialize(suit, rank)
  #     @suit = suit
  #     @rank = rank
  # end
  #
  # def face?(card)
  #   ["J", "K", "Q"].include?(@rank)
  # end
  #
  # def ace?(card)
  #   ["A"].include?(@rank)
  # end
  #
  # def value?(card)
  #   score = 0
  #   if card.face?(card)
  #     score = 10
  #   elsif card.ace?(card)
  #     score = 11
  #   else
  #     score = @rank
  #   end
  #   score
  # end

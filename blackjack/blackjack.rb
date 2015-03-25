#!/usr/bin/env ruby
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'game'
require 'pry'

puts "Welcome to Blackjack"

deck = Deck.new

deck.deal("Player")
deck.deal("Dealer")

################
# puts "Welcome to Blackjack!"
# puts
#
# deck = Deck.new
# player = Hand.new("Player", deck)
# dealer = Hand.new("Dealer", deck)
#
# 2.times do
#   player.deal(deck.draw)
#   dealer.deal(deck.draw)
# end
#
# # player.begin
# puts player
# puts "Players's hand score: #{player.hand_score}"
# puts
#
# until player.bust? || player.blackjack?
#   if player.prompt == "stand"
#     break
#   end
# end
#
# unless player.bust?
#   puts dealer
#   puts "Dealer's hand score: #{dealer.hand_score}"
#   puts
# end

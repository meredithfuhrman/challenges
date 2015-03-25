#!/usr/bin/env ruby
require 'pry'
require 'nokogiri'
require 'net/http'
require 'open-uri'

url = "http://www.amazon.com/Mr-Coffee-BVMC-SJX33GT-Programmable-Coffeemaker/product-reviews/B0047Y0UQO/ref=cm_cr_dp_see_all_btm?ie=UTF8&showViewpoints=1&sortBy=bySubmissionDateDescending"

data = Nokogiri::HTML(open(url))

reviews = data.css('#productReviews')

reviews.each do |review|
  puts review.at_css('.reviewText').text
  puts review.at_css('.swSprite').text
end

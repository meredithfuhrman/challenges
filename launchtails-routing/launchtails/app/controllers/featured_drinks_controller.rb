class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.where("featured = 'true'").page
    render template: "featured-drinks/index"
  end
end

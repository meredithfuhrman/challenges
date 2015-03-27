class Review < ActiveRecord::Base
  belongs_to :restaurants

  validates :body,
    presence: true,
    length: { minimum: 5 }

  validates :rating,
    presence: true,
    numericality: { only_integer: true },
    numericality: { greater_than_or_equal_to: 1},
    numericality: { less_than_or_equal_to: 5}

  validates :restaurant_id,
    presence: true
end

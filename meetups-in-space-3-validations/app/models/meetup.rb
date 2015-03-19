class Meetup < ActiveRecord::Base
  validates :name,
    presence: true,
    length: { maximum: 255 }

  validates :description,
    presence: true,
    length: { maximum: 500 }


  validates :location,
    presence: true,
    length: { maximum: 255 }

  has_many :members
  has_many :users, through: :members
end

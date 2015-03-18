class Meetup < ActiveRecord::Base
  has_many :users, through: :members
end

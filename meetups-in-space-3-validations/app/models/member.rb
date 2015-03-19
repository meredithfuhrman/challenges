class Member < ActiveRecord::Base
  validates :user_id,
    presence: true

  validates :meetup_id, 
    presence: true

  belongs_to :users
  belongs_to :meetups
end

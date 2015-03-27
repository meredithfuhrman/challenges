class Restaurant < ActiveRecord::Base
  has_many :reviews

  validates :name,
    presence: true,
    length: { minimum: 1 }

  validates :address,
    presence: true,
    length: { minimum: 5 }

  validates :city,
    presence: true,
    length: { minimum: 1 }

  validates :state,
    presence: true

  validates :zipcode,
    presence: true

  #uses validates_formatting_of gem
  # validates_formatting_of :zipcode,
  #   presence: true

end

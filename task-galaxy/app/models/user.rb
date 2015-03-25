class User < ActiveRecord::Base
  validates :email,
    presence: true,
    format: { with: /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/}

  validates :password,
    presence: true,
    format: { with: /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})/}
    ##
    #password must be  6 to 20 characters string with at least one digit,
    #one upper case letter, one lower case letter

  has_many :tasks
  has_many :projects, through: :tasks
end

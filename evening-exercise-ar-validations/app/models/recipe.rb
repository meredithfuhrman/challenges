class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /(brussels sprouts)/i }
  validates :yield, numericality: { greater_than_or_equal_to: 1 }

  has_many :comments
end

class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /(brussels sprouts)/i }
  validates :yield, numericality: { mininum: 1 }

  has_many :comments
end

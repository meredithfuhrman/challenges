class Comment < ActiveRecord::Base
  validates :body, length: { maximum: 140 }
  validates :recipe_id, presence: true

  belongs_to :recipes
end

class Post < ApplicationRecord
  belongs_to :category

  validates :slug, uniqueness: true
end

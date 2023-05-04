class Category < ApplicationRecord
  has_many :posts, :dependent => :destroy

  validates :slug, uniqueness: true
end

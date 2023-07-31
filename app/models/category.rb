class Category < ApplicationRecord
  has_many :posts, :dependent => :destroy

  validates :slug, uniqueness: { message: "Liên kết này đã tồn tại" }
end

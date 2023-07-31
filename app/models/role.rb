class Role < ApplicationRecord
  has_many :users

  validates :name, uniqueness: { message: "Role này đã tồn tại" }
end

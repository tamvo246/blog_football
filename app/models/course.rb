class Course < ApplicationRecord
  has_many :students, :dependent => :destroy

  validates :slug, uniqueness: true
end

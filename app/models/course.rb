class Course < ApplicationRecord
  has_many :students, :dependent => :destroy
  has_and_belongs_to_many :coachs

  validates :slug, uniqueness: true

  default_scope {order("created_at DESC")}
end

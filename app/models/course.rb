class Course < ApplicationRecord
  has_many :students, :dependent => :destroy
  has_and_belongs_to_many :coachs

  validates :slug, uniqueness: { message: "Liên kết này đã tồn tại" }

  default_scope {order("created_at DESC")}

  scope :activated, ->{where hide_status: false}
end

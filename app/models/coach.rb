class Coach < ApplicationRecord
  has_and_belongs_to_many :courses

  mount_uploader :avatar, ImageUploader

  validates :email, uniqueness: { message: "Email này đã tồn tại" }
end

class Student < ApplicationRecord
  belongs_to :course

  mount_uploader :avatar, ImageUploader
end

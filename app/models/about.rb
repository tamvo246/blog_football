class About < ApplicationRecord
  validates :slug, uniqueness: true
end

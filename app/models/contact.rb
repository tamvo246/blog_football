class Contact < ApplicationRecord
  belongs_to :course

  validates :email, uniqueness: { message: "Email này đã tồn tại" }
  validates :phone, uniqueness: { message: "Số điện thoại này đã tồn tại" }
end

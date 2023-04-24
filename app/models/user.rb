class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role.name == "Admin"
  end

  def index
    @user = User.all
  end
end

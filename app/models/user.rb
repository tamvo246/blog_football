class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role.name == "admin"
  end

  def supper_admin?
    role.name == "supper_admin"
  end

  def index
    @user = User.all
  end
end

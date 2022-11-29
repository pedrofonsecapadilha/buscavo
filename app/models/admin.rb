class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user
  after_commit :create_parent
  def create_parent
    User.create(phone_number: self.user_phone_number, admin: self, first_name: self.user_first_name, last_name: self.user_last_name)
  end
end

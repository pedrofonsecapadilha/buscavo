class User < ApplicationRecord
  belongs_to :admin
  has_many :rides
  has_many :notifies, dependent: :destroy
  has_many :reviews, dependent: :destroy
end

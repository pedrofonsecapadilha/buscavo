class User < ApplicationRecord
  belongs_to :admin
  has_many :rides
  has_many :reviews, dependent: :destroy
end

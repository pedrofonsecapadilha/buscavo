class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :driver
  has_many :reviews, dependent: :destroy
end

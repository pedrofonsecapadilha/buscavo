class Ride < ApplicationRecord
  belongs_to :user
  has_many :notifies
end

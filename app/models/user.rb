class User < ApplicationRecord
  belongs_to :admin
  has_many :rides
end

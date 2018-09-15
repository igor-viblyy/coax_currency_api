class User < ApplicationRecord
  has_many :currencies

  validates :email, presence: true
end

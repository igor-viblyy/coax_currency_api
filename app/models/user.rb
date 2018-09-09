class User < ApplicationRecord
  has_many :curencies

  validates :email, presence: true
end

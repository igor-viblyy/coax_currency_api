class User < ApplicationRecord
  has_many :currencies, dependent: :destroy

  validates :email, presence: true
end

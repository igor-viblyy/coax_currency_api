class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :user_id
  belongs_to :user
end

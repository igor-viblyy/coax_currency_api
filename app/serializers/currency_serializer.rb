class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :created_at, :updated_at
  belongs_to :user
end

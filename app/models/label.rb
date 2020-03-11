class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy, foreign_key: 'label_id'
  has_many :posts, through: :labelings, source: :post
end

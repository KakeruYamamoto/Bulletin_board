class Comment < ApplicationRecord
  belongs_to :post
  validates :name,  presence: true, length:{maximum:130}
  validates :content,  presence: true, length:{maximum:130}
end

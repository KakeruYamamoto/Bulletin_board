class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :name,  presence: true, length:{maximum:130}
  validates :content,  presence: true, length:{maximum:130}
end

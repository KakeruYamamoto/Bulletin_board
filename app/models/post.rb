class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :labelings, dependent: :destroy, foreign_key: 'post_id'
  has_many :labels, through: :labelings, source: :label

  validates :title,  presence: true, length:{maximum:50}
end

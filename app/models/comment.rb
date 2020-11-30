class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :post

  # validations
  validates :content, presence: true
end

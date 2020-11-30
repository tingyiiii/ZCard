class Board < ApplicationRecord
  # assciation
  has_many :posts

  # validations
  validates :title, presence: true, length: { minimum: 4 }
end

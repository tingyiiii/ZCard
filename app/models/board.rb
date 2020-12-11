class Board < ApplicationRecord
  acts_as_paranoid
  # assciation
  has_many :posts

  # validations
  validates :title, presence: true, length: { minimum: 4 }
end

class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
end

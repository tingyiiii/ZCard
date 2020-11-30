class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :post

  # validations
  validates :content, presence: true

  def owned_by?(u)
    self.user == u
  end
end

class Post < ApplicationRecord
  # association
  belongs_to :board
  belongs_to :user
  has_many :comments

  # validations
  validates :title, presence: true
  validates :content, presence: true

  # def owned_by?(u)
  #   u == user
  # end

  def owned_by?(u)
    self.user == u
  end

end

class Post < ApplicationRecord
  # association
  belongs_to :board
  belongs_to :user
  has_many :comments
  # 多對多
  has_many :favorite_posts
  has_many :favorite_users, through: :favorite_posts, source: :user

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

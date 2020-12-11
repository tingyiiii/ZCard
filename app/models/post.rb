class Post < ApplicationRecord
  acts_as_paranoid

  # 客製化網址
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # 原本是input.to_s.parameterize，但是parameterize只支援英文跟數字，所以改用babosa的to_slug
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  # 定義slug_candidates，預設會找第一個，如果有重複的name就會找第二個（name-price），最後才會生成亂序
  def slug_candidates
    [
      :title,
      [:title, :content]
    ]
  end

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

  # scope
  default_scope { order(id: :desc) }


  # def owned_by?(u)
  #   u == user
  # end

  def owned_by?(u)
    self.user == u
  end

end

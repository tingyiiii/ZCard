class User < ApplicationRecord
  # association
  has_many :posts
  has_many :comments
  # 多對多
  has_many :favorite_posts
  has_many :my_favorites, through: :favorite_posts, source: :post
  
  # validations
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :nickname, presence: true

  # encrypt_password
  before_create :encrypt_password

  def self.login(u)
    pw = Digest::SHA1.hexdigest("a#{u[:password]}z")
    User.find_by(email: u[:email], password: pw)
  end

  def favorite?(post)
    my_favorites.include?(post)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

end

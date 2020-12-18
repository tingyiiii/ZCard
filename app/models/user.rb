class User < ApplicationRecord
  # 有限狀態機
  include AASM

  # association
  has_many :posts
  has_many :comments
  has_many :boards
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

  # 有限狀態機流程
  aasm column: 'state', no_direct_assignment: true do
    state :user, initial: true
    state :vip, :vvip

    event :pay_vip do
      transitions from: :user, to: :vip
    end

    event :pay_vvip do
      transitions from: [:user, :vip], to: :vvip
    end
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

end

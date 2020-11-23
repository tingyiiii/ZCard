class User < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :nickname, presence: true

  # encrypt_password
  before_create :encrypt_password

  has_many :posts

  def self.login(u)
    pw = Digest::SHA1.hexdigest("a#{u[:password]}z")
    User.find_by(email: u[:email], password: pw)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

end

class Comment < ApplicationRecord
  acts_as_paranoid
  # association
  belongs_to :user
  belongs_to :post

  # validations
  validates :content, presence: true

  # 預設過濾掉假刪除的資料
  # default_scope { where(deleted_at: nil) }
  default_scope {  order(id: :desc) }
 
  # example:
  # modle:
  # scope :cheap, -> { where("price < 50") }
  # scope :forb, -> { where("age >= 18") }
  # scope :x, -> { cheap.forb }
  # controller:
  # Product.forb.cheap
  # Product.x
  
  # def destroy
  #   update(deleted_at: Time.now)
  # end
  
  

  def owned_by?(u)
    self.user == u
  end
end

class Board < ApplicationRecord
  acts_as_paranoid
  # 有限狀態機
  include AASM

  # assciation
  has_many :posts

  # validations
  validates :title, presence: true, length: { minimum: 4 }

  # 有限狀態機流程
  aasm column: 'state', no_direct_assignment: true do
    state :open, initial: true
    state :hidden, :locked

    event :hide do
      transitions from: :open, to: :hidden

      # 發通知：after
      after do 
        puts "發簡訊！"
      end

      # 錯誤時：error
      # error do 
      #   puts "發簡訊！"
      # end
    end

    event :lock do
      transitions from: :open, to: :locked
    end

    event :open do
      transitions from: [:hidden, :locked], to: :open
    end
  end

end

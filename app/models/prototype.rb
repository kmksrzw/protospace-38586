class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
# 画像のバリデについては今の所下記の記述での指示あり
  validates :image, presence: true
  
  # 画像の有無によって、バリデーションを行うか条件分岐させる記術：まだ使用しないみたい
  # validates :image, presence: true, unless: :was_attached?

  # def was_attached?
    # self.image.attached?
  # end
end

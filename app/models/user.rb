class User < ApplicationRecord
  before_save{self.email = email.downcase}
  has_one_attached :picture
  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def notifications
    # 通知モデルとの関連付けにより、通知を取得するメソッドを定義します
    Notification.where(user_id: self.id)
  end
  
  def unread_notifications
    notifications.where(read: false)
  end

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 100},
  format: {with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
 
  validates :picture, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "有効なフォーマットではありません" },
    size: { less_than: 5.megabytes, message: " 5MBを超える画像はアップロードできません" }

    def favorite?(movie)
      movies.exists?(movie.id)
    end
end



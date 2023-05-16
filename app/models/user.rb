class User < ApplicationRecord
  before_save{self.email = email.downcase}
  has_one_attached :picture

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 100},
  format: {with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
 
  validates :picture, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "有効なフォーマットではありません" },
    size: { less_than: 5.megabytes, message: " 5MBを超える画像はアップロードできません" }
end

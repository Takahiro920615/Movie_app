class User < ApplicationRecord
  before_save{self.email = email.downcase}

  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 100},
  format: {with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
 
  no_image_path = Rails.root.join("public", "user_images", "no_image.png")
end

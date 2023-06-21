class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  # validates :detail, length:{ maximum: 300}
  # validates :impression, length:{ maximum:300}
  # validates :title, length:{ minimum:1 }
  mount_uploader :img, ImgUploader

  # def check_duplicate_title
  #   if Movie.exists?(title: title)
  #    errors.add(:title,"の投稿はすでにありますよ！")
  #   end
  # end
  # def favorite?(user)
  #   favorites.where(user_id: user.id)
  # end
end

class Movie < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name,uniqueness: true

  def check_duplicate_title
    if Movie.exists?(title: title)
     errors.add(:title,"の投稿はすでにありますよ！")
    end
  end
end

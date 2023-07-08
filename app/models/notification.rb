class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment, foreign_key: "comment_id"

  scope :unread, -> { where(read: false)}
end

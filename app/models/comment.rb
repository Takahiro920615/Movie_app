class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :notifications, dependent: :destroy
end
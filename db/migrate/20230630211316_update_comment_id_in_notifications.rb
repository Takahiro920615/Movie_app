class UpdateCommentIdInNotifications < ActiveRecord::Migration[7.0]
  def change
    rename_column :notifications, :comment_id, :comment_id
  end
end

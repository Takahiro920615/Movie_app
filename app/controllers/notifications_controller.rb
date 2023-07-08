class NotificationsController < ApplicationController

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(read: true)
    comment_id = notification.comment_id
    user_id = notification.user_id
    Comment.find(comment_id).update(read: true)
    User.find(user_id).update(read: true)
    redirect_to user_path(current_user.id)
  end
end

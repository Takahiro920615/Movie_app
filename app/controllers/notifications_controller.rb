class NotificationsController < ApplicationController

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(read: true)
    redirect_to user_path(current_user)
  end
end

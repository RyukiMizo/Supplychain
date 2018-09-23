class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end
  def link_through
    @notification = Notic.find(params[:id])
    @notification.update read: true
    redirect_to "postpages/#{@notificatin.micropost.id}"
  end
end

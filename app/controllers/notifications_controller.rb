class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notics
  end
  def link_through
    @notification = Notic.find(params[:id])
    @notification.update read: true
    redirect_to "postpages/#{@notificatin.micropost.id}"
  end
end

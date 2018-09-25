class NoticsController < ApplicationController
  def index
    @notics = current_user.notics
  end
  
  def link_through
    @notic = Notic.find(params[:id])
    @notic.update read: true
    
    if @notic.notified_type == "いいね"
      redirect_to "/postpage/#{@notic.micropost.id}"
    else
      redirect_to "/users/#{@notic.notified_by.id}"
    end
  end
end

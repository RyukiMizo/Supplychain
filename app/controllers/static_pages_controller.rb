class StaticPagesController < ApplicationController
  
  def producer
  end
  
  def retailing
  end
  def privacy
  end
  
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      flash[:info] = "送信しました。返信までしばらくお待ちください。"
      @inquiry.destroy
      redirect_to request.referrer || root_url
    end
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end

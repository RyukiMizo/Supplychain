class StaticPagesController < ApplicationController
  def law
  end
  def payform
  end
  def pay
    Payjp.api_key = 'sk_test_3f6dafed676cad30649e06a7'
    charge = Payjp::Charge.create(
    :amount => 1980,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
  
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

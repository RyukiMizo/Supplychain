class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:pay, :payform]
  before_action :already_pay, only: [:pay]
 
  def law
  end
  
  def payform
  end
  
  def pay
    Payjp.api_key = PAYJP_SECRET_KEY
    charge = Payjp::Charge.create(
    :amount => 1980,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    current_user.update_attribute(:pay, true)
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
  
  def already_pay
    if current_user.pay == true
      flash[:success] = '既にお支払いが完了しています！'
      redirect_to request.referrer || root_url
    end
  end
end

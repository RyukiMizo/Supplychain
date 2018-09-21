class SessionsController < ApplicationController
  def new
  end
  
  def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    if user.activated?
      　log_in user
      　params[:session][:remember_me] == '1' ? remember(user) : forget(user)
     　  redirect_back_or(user)
    else
        message  = "本登録が完了していません. "
        message += "メールをチェックして, 本登録を完成させてください."
        flash[:warning] = message
        redirect_to root_url
    end
  else
      flash.now[:danger] = 'メールアドレスとパスワードが, 無効な組み合わせです.'
      render 'new'
  end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end

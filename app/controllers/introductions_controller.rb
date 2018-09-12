class IntroductionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :new, :edit]
  before_action :correct_user, only: [:update, :edit]
  
  def edit
  end
  
  def new
    @introduction = current_user.create_introduction if logged_in?
  end
  
  def create
    @introduction = current_user.create_introduction(introduction_params)
    if @introduction.save
      flash[:success] = "投稿完了！"
      redirect_to user_url(current_user)
    else
      flash[:danger] = "投稿失敗：　入力内容に不備があります"
      redirect_to request.referrer || root_url
    end
  end
  
  def update
    if @introduction.update_attributes(introduction_params)
      flash[:success] = "更新完了!"
      redirect_to user_url(current_user)
    else
      @introduction.attributes = introduction_params
      flash[:danger] = "更新失敗：　入力内容に不備があります"
      redirect_to request.referrer || root_url
    end
      
  end
      
  
  private
  
  def introduction_params
    params.require(:introduction).permit(:content, :prefecture, :affilitation, :site)
  end
  
  def correct_user
    @introduction = current_user.introduction
    redirect_to root_url if @introduction.nil?
  end
  
    
end


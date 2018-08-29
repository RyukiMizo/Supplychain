class IntroductionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :new, :edit]
  before_action :correct_user, only: [:update, :new, :edit]
  
  
  def new
   
  end
  
  def create
    @introduction = current_user.create_introduction(introduction_params)
    if @introduction.save
      flash[:success] = "投稿完了！"
      redirect_to '/users/#{current_user.id}'
    else
      render 'static_pages/home'
    end
  end
  
  def update
  end
      
  
  private
  
  def introduction_params
    params.require(:introduction).permit(:content)
  end
end


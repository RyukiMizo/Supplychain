class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following,
                                        :followers, :follow_index]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to users_url
  end
  
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def follow_index
     if logged_in?
        @microposts = current_user.feed.paginate(page: params[:page]).search(params[:search])
     end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "仮登録が完了しました。メールにて本登録を完了してください！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新完了！"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
      
  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :thumbnail, :introduction, :accepted)
    end
  
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    
end
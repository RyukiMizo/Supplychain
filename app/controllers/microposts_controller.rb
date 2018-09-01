class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
    before_action :correct_user, only: [:destroy, :edit, :update]
    
    def edit
        @micropost = Micropost.find(params[:id])
        @blocks = @micropost.blocks
        @micropost.photo.cache! unless @micropost.photo.blank?
        number = @blocks.count
        number.times do |n|
          @blocks[n].picture.cache! unless @blocks[n].picture.blank?
        end
    end
    
    def update
        @micropost = Micropost.find(params[:id])
        if @micropost.update_attributes(micropost_params)
            flash[:success] = "更新完了"
            redirect_to request.referrer || root_url
        end
    end
    
    def show
        @micropost = Micropost.find(params[:id])
        @blocks = @micropost.blocks
    end
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save 
            flash[:success] = "投稿完了"
            redirect_to user_url(current_user)
        else
            render 'static_pages/home'
        end
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "削除完了" 
        redirect_to request.referrer || root_url
    end
    
    private
    
    def micropost_params
        params.require(:micropost).permit(:product, :photo, :photo_cache,
                blocks_attributes: [:id, :place, :date, :information, :picture_cache,
                                    :micropost_id, :_destroy, :picture])
    end
    
    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end

class LikesController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @micropost = Micropost.find(params[:id]) 
        @like = current_user.likes.build(micropost_id: params[:id])
        @like.save
        @micropost.reload
        respond_to do |format|
          format.html{redirect_to request.referrer || root_url}
          format.js
        end
    end
    
    
    def destroy
        @micropost = Micropost.find(params[:id]) 
        @like = current_user.likes.find_by(micropost_id: params[:id])
        @like.destroy
        @micropost.reload
        respond_to do |format|
          format.html{redirect_to request.referrer || root_url}
          format.js
        end
    end
end

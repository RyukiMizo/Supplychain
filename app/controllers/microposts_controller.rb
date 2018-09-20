class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :edit, :update, :new, :qrcode, :like_index]
    before_action :correct_user, only: [:destroy, :edit, :update]
    require 'will_paginate/array'
    require 'rqrcode'
    require 'rqrcode_png'
    require 'chunky_png'

    def qrcode
     @micropost = Micropost.find(params[:id])
     options = {
       fill: 'white',
       color: 'black',
       size: 200,
       border_modules: 3,
       module_px_size: 5,
       file: nil,
     }
      text = request.url
      qrcode = RQRCode::QRCode.new(text).as_png(options)
      send_data(qrcode, type: 'image/png', filename: "#{@micropost.product}.png")
    end
    
    
    def index
        @microposts = Micropost.all.paginate(page: params[:page]).search(params[:search])
    end
    
    def active
        @microposts = Micropost.unscoped.order(likes_count: :asc).paginate(page: params[:page]).search(params[:search])
    end
    
    def like_index
        @likes = current_user.likes
    end
    
    def new
        @micropost = current_user.microposts.build if logged_in?
        @micropost.blocks.build if logged_in?
    end
    
    def edit
        @micropost = Micropost.find(params[:id])
        @blocks = @micropost.blocks
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
        @chains = @micropost.chains
    end
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save 
            flash[:success] = "投稿完了"
            redirect_to user_url(current_user)
        else
            render 'new'
        end
    end
    
    def destroy
        @micropost.destroy
        flash[:success] = "削除完了" 
        redirect_to request.referrer || root_url
    end
    
    private
    
    def micropost_params
        params.require(:micropost).permit(:product, :photo,
                blocks_attributes: [:id, :place, :date, :information,
                                    :micropost_id, :_destroy, :picture])
    end
    
    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end
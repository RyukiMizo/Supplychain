class ChainsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user, only: [:destroy]
    
    def destroy
        @deepchain.destroy
        flash[:success] = "削除完了"
        redirect_to request.referrer || root_url
        
    end
    
    def new
        @chain = current_user.chains.build if logged_in?
        @chain.deepchains.build if logged_in?
    end
    
    def create
        @chain = current_user.chains.build(chain_params)
        @chain.micropost_id = params[:id]
        @user = Micropost.find(params[:id]).user
        @deepchains = @chain.deepchains
        if @deepchains.nil?
            flash[:danger] = "入力してください"
            redirect_to "/postpage/#{params[:id]}"
        end
            
          if current_user.followers.include?(@user) || current_user == @user
              
            if @chain.save
              flash[:success] = "作成完了"
              redirect_to "/postpage/#{params[:id]}"
            else
              render 'new'
            end 

          else
              flash[:danger] = "フォローされていないため追加権限がありません"
              redirect_to user_url(@user)
          end
    end
    
    private
    
    def chain_params
            params.require(:chain).permit(:contact,
                   deepchains_attributes: [:id, :place, :date, :information, :chain_id,
                                       :_destroy, :chainpicture])
    end
    
    def correct_user
        @deepchain = Deepchain.find(params[:id])
        if current_user != @deepchain.chain.user && current_user != @deepchain.chain.micropost.user
          redirect_to root_url
        end
    end
end

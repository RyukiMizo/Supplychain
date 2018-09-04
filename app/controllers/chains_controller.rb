class ChainsController < ApplicationController
    before_action :logged_in_user, only: [:new]
    def new
        @chain = Micropost.find(params[:id]).chains.build if logged_in?
    end
    
    def create
        @chain = Micropost.find(params[:id]).chains.build(chain_params)
        if @chain.save 
            flash[:success] = "作成完了"
            redirect_to "/postpage/#{params[:id]}"
        else
            render 'static_pages/home'
        end
    end
    
    private
    
    def chain_params
            params.require(:chain).permit(:contact,
                   deepchains_attributes: [:id, :place, :date, :information, :chain_id,
                                       :_destroy, :chainpicture])
    end
end

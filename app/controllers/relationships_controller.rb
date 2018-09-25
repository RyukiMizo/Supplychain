class RelationshipsController < ApplicationController
    before_action :logged_in_user
    after_action :create_notics, only:[:create]
    
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        respond_to do |format|
            format.html{redirect_to @user}
            format.js
        end
    end
    
    def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
        respond_to do |format|
            format.html{redirect_to @user}
            format.js
        end
    end
    
    private
    def create_notics
        @notic = @user.notics.build(
                             notified_by_id: current_user.id,
                             notified_type: 'フォロー')
        @notic.save
    end
    
end

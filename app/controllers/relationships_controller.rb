class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:relationship][:follower_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).follower
    current_user.unfollow!(@user)
  end
end

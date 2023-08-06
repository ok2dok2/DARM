class UsersController < ApplicationController
  def index
    @users = User.all

  if params[:tag_name]
    @users = User.tagged_with(params[:tag_name])
  end

  if params[:tag]
    @users = User.tagged_with(params[:tag], wild: true)
  end
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @user_tag = @user.tag_list
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @user_tag = @user.tag_list
  end
end

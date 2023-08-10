class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    #@users = User.all

  if params[:tag_name]
    @users = User.where.not(id: current_user.id).tagged_with(params[:tag_name])
  end

  if params[:tag]
    @users = User.where.not(id: current_user.id).tagged_with(params[:tag], wild: true)
  end

    @distances = []
    @users.each do |user|
      @distances << current_user.distance_to(user)

    end

  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @user_tag = @user.tag_list
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def update_location
    @user = current_user
    latitude = params[:latitude]
    longitude = params[:longitude]
    
    @user.update(latitude: latitude, longitude: longitude)
    render json: { message: '位置情報が更新されました。' }
  end
end

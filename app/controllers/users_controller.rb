class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where.not(id: current_user.id).page(params[:page]).per(5)
    #@users = User.all

  if params[:tag_name]
    @users = User.where.not(id: current_user.id).tagged_with(params[:tag_name]).page(params[:page]).per(5)
  end

  if params[:tag]
    @users = User.where.not(id: current_user.id).tagged_with(params[:tag], wild: true).page(params[:page]).per(5)
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
    @distances_following = []
    @user.following.each do |user|
      @distances_following << current_user.distance_to(user)
    end
    @distances_follower = []
    @user.followers.each do |user|
      @distances_follower << current_user.distance_to(user)
    end
  end
  
  def following
    @user = User.find(params[:id])
  end

  def follower
    @user = User.find(params[:id])
  end

  def update_location
    @user = current_user
    latitude = params[:latitude]
    longitude = params[:longitude]
    
    @user.update(latitude: latitude, longitude: longitude)
    render json: { message: '位置情報が更新されました。' }
  end
end

class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました"
    else
      @topics = Topic.all
      render :index, notice:"トピックの作成に失敗しました"
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @post = @topic.posts.build
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topic_post_path
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :image, :youtube, :introduce)
  end
end

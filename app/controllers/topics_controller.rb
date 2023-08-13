class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save notice: "トピックを作成しました"
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @post = @topic.posts.build
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :image)
  end
end

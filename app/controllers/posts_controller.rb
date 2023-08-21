class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user_id = current_user.id


    respond_to do |format|
      if @post.save
        format.js { render 'index' }
      else 
        format.html { redirect_to topic_path(@topic), notice: '投稿に失敗しました'}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

end

class PostsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)

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
class FavoritesController < ApplicationController
  before_action :set_timeline

  def create
    if @timeline.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, timeline_id: @timeline.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, timeline_id: @timeline.id)
    @favorite.destroy
  end

  private
  def set_timeline
    @timeline = Timeline.find(params[:timeline_id])
  end
end

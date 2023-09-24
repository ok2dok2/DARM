class TimelinesController < ApplicationController
  before_action :authenticate_user!
  def index
    following_ids = current_user.following.pluck(:id)
    following_ids << current_user.id
    @timelines = Timeline.where(user_id: following_ids).page(params[:page]).per(3)
    @timeline = Timeline.new
  end

  def new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    @timeline.user = current_user
    if @timeline.save
    redirect_to timelines_path, notice: "タイムラインを更新しました"
    else
      render :index, notice: "タイムラインの更新ができませんでした"
    end
  end

  def translate_auto
    translated_text = translate_message(params[:text])
    render json: { translation: translated_text }
  end

  private
  def timeline_params
    params.require(:timeline).permit(:content, { images: []})
  end

  def translate_message(text)
    require "google/cloud/translate/v2"
    api_key = ENV['GOOGLE_TRANSLATION_API_KEY']
    translate = Google::Cloud::Translate::V2.new(key: api_key)
    target_language = message_is_japanese?(text) ? "ko" : "ja"
    translation = translate.translate(
      text,
      to: target_language # 適切なターゲット言語を設定
    )
    translation.text
  end


  #自動翻訳のアクション(日本語⇔韓国語を自動認識させるためのアクション) 
  def message_is_japanese?(text)
    japanese_characters = /[\p{Hiragana}\p{Katakana}\p{Han}ー]/
    text =~ japanese_characters
  end
end
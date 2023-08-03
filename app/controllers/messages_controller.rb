class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    if @messages.length >10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end

    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
    #render partial: 'messages/index'
  end

  def create
    @message = @conversation.messages.build(message_params)
    @messages = @conversation.messages
    
    respond_to do |format|
    if @message.save
      #format.html { redirect_to conversation_messages_path(@conversation) }
      #redirect_to conversation_messages_path(@conversation)
      #render :index
      format.js { render :create }
    else
      format.html { render 'index' }
      format.js { render :create }
    end
    end
  end

  def translate
    text_to_translate = params[:text]
    source_language = params[:source_language]
    target_language = params[:target_language]
  
    translation = translate_text(text_to_translate, source_language, target_language)
    render json: { translation: translation }
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :image)
  end

  def translate_text(text, source_language, target_language)
    require "google/cloud/translate/v2"
    api_key = ENV['GOOGLE_TRANSLATION_API_KEY']
    #translator = Google::Cloud::Translate.translation_v2_service(credentials: Rails.application.credentials.google_translation_api_key)
    #translate  = Google::Cloud::Translate.new version: :v2, project_id: 'noted-tide-394113'
    #translator= Google::Cloud::Translate::V2.new(key: 'AIzaSyBDqsQSgtxVJxtBdlhs9Icy46YLErEPgoU') 
    translator= Google::Cloud::Translate::V2.new(key: api_key) 
    result = translator.translate(text, from: source_language, to: target_language)
  
    result.text # 翻訳結果のテキストを返す
  end
end
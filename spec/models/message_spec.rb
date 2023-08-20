require 'rails_helper'

RSpec.describe Event, type: :model do
  it "bodyの入力があれば有効な状態であること" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    conversation = Conversation.create(
      sender_id: user.id,
      recipient_id: user2.id
    )
    message = Message.new(
      body: 'やほ！',
      conversation_id: conversation.id,
      user_id: user.id
    )
    expect(message).to be_valid
  end

  it "bodyの入力がなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    conversation = Conversation.create(
      sender_id: user.id,
      recipient_id: user2.id
    )
    message = Message.new(
      body: nil,
      conversation_id: conversation.id,
      user_id: user.id
    )
    expect(message).not_to be_valid
  end

end
require 'rails_helper'

RSpec.describe Event, type: :model do
  it "senderとrecipientが異なれば有効な状態であること" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user2)
    conversation = Conversation.create(
      sender_id: user.id,
      recipient_id: user2.id
    )
    expect(conversation).to be_valid
  end

  it "senderとrecipientが同じ場合は無効な状態であること" do
    user = FactoryBot.create(:user3)
    conversation = Conversation.create(
      sender_id: user.id,
      recipient_id: user.id
    )
    conversation2 = Conversation.new(
      sender_id: user.id,
      recipient_id: user.id
    )
    expect(conversation2).not_to be_valid
  end

end
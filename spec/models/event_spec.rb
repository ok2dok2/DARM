require 'rails_helper'

RSpec.describe Event, type: :model do
  it "name,place,introduce,contactがあれば有効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id)
    expect(event).to be_valid
  end

  it "introduceがなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, introduce: nil )
    expect(event).not_to be_valid
  end

  it "placeがなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, place: nil )
    expect(event).not_to be_valid
  end

  it "contactがなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, contact: nil )
    expect(event).not_to be_valid
  end

  it "contactが25字以上なら無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, contact: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' )
    expect(event).not_to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, name: nil )
    expect(event).not_to be_valid
  end

  it "nameが30字以上なら無効な状態であること" do
    user = FactoryBot.create(:user)
    event = FactoryBot.build(:event, user_id: user.id, name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' )
    expect(event).not_to be_valid
  end

end
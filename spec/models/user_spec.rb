require 'rails_helper'

RSpec.describe User, type: :model do
  it "name,email,age,introduce,psaaword,tag_listがあれば有効な状態であること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  it "nameが空白の場合は無効であること" do
    user = FactoryBot.build(:user, name: nil )
    expect(user).not_to be_valid
  end
  it "nameに重複があったら無効であること" do
    FactoryBot.create(:user)
    user2 = User.new(
      name: 'user22',
      email: 'user222@gmail.com',
      age: '26',
      password: 'passpass',
      introduce: 'ユーザー2です。',
      tag_list: 'なにわ男子,大橋和也'
    )
    expect(user2).not_to be_valid
  end
  it "nameの文字数が10文字超えたら無効であること" do
    user = FactoryBot.build(:user, name: 'なにわ男子のリーダー大橋和也')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("は10文字以内で入力してください")
  end

  it "passwordが空白の場合は無効であること" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "ageが2文字以上の入力の場合は無効であること" do
    user = FactoryBot.build(:user, age: 200)
    expect(user).not_to be_valid
    expect(user.errors[:age]).to include("は2文字以内で入力してください")
  end

  it "introduceが空白の場合は無効であること" do
    user = FactoryBot.build(:user, introduce: nil)
    expect(user).not_to be_valid
    expect(user.errors[:introduce]).to include("を入力してください")
  end
end
require 'rails_helper'

RSpec.describe Topic, type: :model do
  include CarrierWave::Test::Matchers
        #メンタリング！！！！！！
  it "name,introduce,image,youtubeがあれば有効な状態であること" do
    user = FactoryBot.create(:user)
    puts Rails.root.join('spec', 'fixtures', 'topic22.jpg')
    binding.pry
    topic = Topic.new(
      name: 'stayc',
      introduce: '6人組ガールズグループ',
      youtube: '3-ptVHZZdBg',
      image: Rack::Test::UploadedFile.new(File.open(Rails.root.join('spec', 'fixtures', 'topic2.jpg'))),
      user_id: user.id
    )
    expect(topic).to be_valid
  end
        #上ができないからまだ
  it "nameがなければ、無効な状態であること" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.build(:topic, user_id: user.id,)
    expect(topic).not_to be_valid
  end

        #同じくまだ
  it "youtubeは11文字でないと、無効な状態であること" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.build(:topic, user_id: user.id,)
    expect(topic).not_to be_valid
  end

  it "imageがないと、無効な状態であること" do
    user = FactoryBot.create(:user)
    topic = Topic.new(
      name: 'stayc',
      introduce: '6人組ガールズグループ',
      youtube: '3-ptVHZZdBg',
      image: nil,
      user_id: user.id
    )
    expect(topic).not_to be_valid
  end
end




require 'rails_helper'

RSpec.describe Topic, type: :model do
  include CarrierWave::Test::Matchers
  it "name,introduce,image,youtubeがあれば有効な状態であること" do
    user = FactoryBot.create(:user)
    topic = Topic.new(
      name: 'stayc',
      introduce: '6人組ガールズグループ',
      youtube: '3-ptVHZZdBg',
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/image11.jpg')),
      user_id: user.id
    )
    expect(topic).to be_valid
  end

  it "nameがなければ、無効な状態であること" do
    user = FactoryBot.create(:user)
    topic = Topic.new(
      name: nil,
      introduce: '6人組ガールズグループ',
      youtube: '3-ptVHZZdBg',
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/image11.jpg')),
      user_id: user.id
    )
    expect(topic).not_to be_valid
  end

  it "youtubeは11文字でないと、無効な状態であること" do
    user = FactoryBot.create(:user)
    topic = Topic.new(
      name: nil,
      introduce: '6人組ガールズグループ',
      youtube: '3-ptVHZZdBg1111',
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/image11.jpg')),
      user_id: user.id
    )
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




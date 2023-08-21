require 'rails_helper'

RSpec.describe Post, type: :model do
  it "contentがあれば有効な状態であること" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    post = Post.new(
      content: 'testです',
      topic_id: topic.id,
      user_id: user.id
    )
    expect(post).to be_valid
  end

  it "contentがなくてimageがある場合は有効な状態であること" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    post = Post.new(
      content: nil,
      topic_id: topic.id,
      user_id: user.id,
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/topic2.jpg'))
    )
    expect(post).to be_valid
  end

  it "contentもimageもない場合は無効であること" do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    post = Post.new(
      content: nil,
      topic_id: topic.id,
      user_id: user.id,
      image: nil
    )
    expect(post).not_to be_valid
  end
end

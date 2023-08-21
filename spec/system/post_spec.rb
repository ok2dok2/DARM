require 'rails_helper'
RSpec.describe Post, type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @topic = FactoryBot.create(:topic, user_id: @user.id)
    visit new_user_session_path
    fill_in 'user[email]', with: 'user22@gmail.com'
    fill_in 'user[password]', with: 'passpass'
    click_button 'ログイン'
  end
  describe '投稿' do
    context 'ログイン中の場合' do
      it 'トピックに投稿ができること' do
        click_link 'TOPICS'
        click_link 'Stayc'
        fill_in 'post[content]', with: '개 쩔어...'
        #execute_script('document.querySelector("#post_content").value = "개 쩔어...";')
        attach_file 'post[image]', File.join(Rails.root, 'spec/fixtures/images/image11.jpg')
        find('.soushin').click
        expect(page).to have_content "개 쩔어..."
      end


        # it 'トピックの閲覧ができること' do
        #   click_link 'TOPICS'
        #   find('.btn.btn-primary[data-toggle="modal"][data-target="#modal1"]').click
        #   fill_in 'topic[name]', with: 'LOVELYZ'
        #   fill_in 'topic[introduce]', with: 'LOVELYZ！！！'
        #   attach_file 'topic[image]', File.join(Rails.root, 'spec/fixtures/images/image11.jpg')
        #   fill_in 'topic[youtube]', with: 'QlA18C7WtJI'
        #   click_button 'create_topic_button'
        #   click_link 'LOVELYZ'
        #   expect(page).to have_content "LOVELYZ"
        # end
    end
  end
end
require 'rails_helper'
RSpec.describe Topic, type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'トピック' do
    it '作成ができること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_button 'ログイン'
      click_link 'TOPICS'
      find('.btn.btn-primary[data-toggle="modal"][data-target="#modal1"]').click
      fill_in 'topic[name]', with: 'LOVELYZ'
      fill_in 'topic[introduce]', with: 'LOVELYZ！！！'
      attach_file('topic[image]', Rails.root.join('spec/fixtures/image11.jpg'))
      fill_in 'topic[youtube]', with: 'QlA18C7WtJI'
      #find('topic_soushin').click
      click_button 'create_topic_button'
      expect(page).to have_content "LOVELYZ"
    end

    # it 'トピックの閲覧ができること' do
    #   FactoryBot.create(:relationship, follow_id: @user.id, follower_id: @user2.id)
    #   visit new_user_session_path
    #   fill_in 'user[email]', with: 'user22@gmail.com'
    #   fill_in 'user[password]', with: 'passpass'
    #   click_link 'USER'
    #   find('.bi-heart-fill').click
    #   click_link 'マイページ'
    #   expect(page).to have_content "user222"
    # end
  end
end
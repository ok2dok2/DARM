require 'rails_helper'
RSpec.describe User, type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'トピックの作成と検索' do
    it '作成ができること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_link 'USER'
      find('.followbtn', wait: 3).click
      click_link 'マイページ'
      expect(page).to have_content "user222"
    end

    it 'フォロー解除ができること' do
      FactoryBot.create(:relationship, follow_id: @user.id, follower_id: @user2.id)
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_link 'USER'
      find('.bi-heart-fill').click
      click_link 'マイページ'
      expect(page).to have_content "user222"
    end
  end
end
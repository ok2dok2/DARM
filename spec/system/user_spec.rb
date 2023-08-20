require 'rails_helper'
RSpec.describe User, type: :system do
  describe 'ユーザー登録,ログインテスト' do
    it '新規登録できること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'testuser1'
      fill_in 'user[age]', with: '26'
      fill_in 'user[email]', with: 'testuser1@gmail.com'
      fill_in 'user[password]', with: 'pass'
      fill_in 'user[password_confirmation]', with: 'pass'
      fill_in 'user[introduce]', with: 'testだよ～!'
      #attach_file('user[images][]', Rails.root.join('spec/fixtures/user22.jpg'))
      fill_in 'user[tag_list]', with: 'いない'
      click_button 'アカウント作成'
      expect(page).to have_content "ログイン"
    end
  end
  
  describe '遷移テスト' do
    it 'ユーザがログインせずUSER一覧画面に飛ぼうとしたとき、ログイン画面に遷移' do
      visit users_path
      expect(page).to have_content "ログイン"
    end

    it 'ログインしてマイページに遷移' do
      FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_button 'ログイン'
      click_link 'マイページ'
      expect(page).to have_content "user22"
    end

    it 'ログインしてユーザー一覧に遷移後、ユーザー検索' do
      FactoryBot.create(:user)
      FactoryBot.create(:user2)
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_button 'ログイン'
      click_link 'USER'
      fill_in 'tag', with: 'IN'
      find('.user_button').click
      expect(page).to have_content "INFINITE"
    end
  end
end
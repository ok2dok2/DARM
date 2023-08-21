require 'rails_helper'
RSpec.describe Relationship, type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
  end
  describe 'フォロー機能' do
    context 'まだフォローしてないユーザーの場合' do
      it 'フォローができること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user22@gmail.com'
        fill_in 'user[password]', with: 'passpass'
        click_button 'ログイン'
        click_link 'USERS'
        find('#followbtn_0').click
        click_link 'マイページ'
        expect(page).to have_content "222"
      end
    end
    context 'すでにフォローしているユーザーの場合' do
      it 'フォロー解除ができること' do
        FactoryBot.create(:relationship, follow_id: @user.id, follower_id: @user2.id)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user22@gmail.com'
        fill_in 'user[password]', with: 'passpass'
        click_button 'ログイン'
        click_link 'USERS'
        find('#remove_0').click
        click_link 'マイページ'
        expect(page).not_to have_content "222"
      end
    end
  end
end
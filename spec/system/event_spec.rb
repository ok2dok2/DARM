require 'rails_helper'
RSpec.describe Event, type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'イベント投稿、検索' do
    ★★メンタリング★★
    # it 'イベントの新規登録できること' do
    #   visit new_user_session_path
    #   fill_in 'user[email]', with: 'user22@gmail.com'
    #   fill_in 'user[password]', with: 'passpass'
    #   click_button 'ログイン'
    #   click_link 'EVENT'
    #   find('.btn.btn-primary[data-toggle="modal"][data-target="#modal1"]').click
    #   fill_in 'event[name]', with: '728会'
    #   fill_in 'event[place]', with: '大阪駅'
    #   fill_in 'event[place]', with: '2023-07-28 12:00'
    #   fill_in 'event[contact]', with: 'LINE→728728728'
    #   fill_in 'event[tag_list]', with: 'テストだよ'
    #   find('.bi-cursor-fill').click
    #   expect(page).to have_content "maked event"
    # end
    it '検索ができること' do
      FactoryBot.create(:event, user_id: @user.id)
      visit new_user_session_path
      fill_in 'user[email]', with: 'user22@gmail.com'
      fill_in 'user[password]', with: 'passpass'
      click_button 'ログイン'
      click_link 'EVENT'
      fill_in 'tag', with: '72'
      find('.bi-search-heart').click
      expect(page).to have_content "LINE→728728"
    end
  end
end
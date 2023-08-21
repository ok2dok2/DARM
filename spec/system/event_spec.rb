require 'rails_helper'
RSpec.describe Event, type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user[email]', with: 'user22@gmail.com'
    fill_in 'user[password]', with: 'passpass'
    click_button 'ログイン'
  end
  describe 'イベント投稿、検索' do
    it 'イベントの新規登録できること' do
      # @event = FactoryBot.create(:event, user_id: @user.id)
      click_link 'EVENTS'
      click_button "オフ会情報作成1"
      find('input[name="event[name]"]').send_keys('728会')
      find('input[name="event[place]"]').send_keys('728会')
      find('input[name="event[introduce]"]').send_keys('728会')
      find('input[name="event[contact]"]').send_keys('728728')
      #expect(page).to have_selector("#modal1")
      #expect(page).to have_content("※YYYYMMDD HH:MM")
      #find('.event_menu_bar_button').click
      # fill_in 'event[name]', with: '728会'
      # fill_in 'event[place]', with: '大阪駅'
      # fill_in 'event[start_at]', with: '2023-07-28 12:00'
      # fill_in 'event[introduce]', with: '集合～'
      # fill_in 'event[contact]', with: 'LINE→728728728'
      # fill_in 'event[tag_list]', with: 'テストだよ'
      # attach_file 'event[image]', File.join(Rails.root.join('spec/fixtures/images/user22.jpg'))
      find('.bi-cursor-fill').click
      binding.pry
      expect(page).to have_content "728"
    end
    
    # it '検索ができること' do
    #   FactoryBot.create(:event, user_id: @user.id)
    #   visit new_user_session_path
    #   fill_in 'user[email]', with: 'user22@gmail.com'
    #   fill_in 'user[password]', with: 'passpass'
    #   click_button 'ログイン'
    #   click_link 'EVENT'
    #   fill_in 'tag', with: '72'
    #   find('.bi-search-heart').click
    #   expect(page).to have_content "LINE→728728"
    # end
  end
end
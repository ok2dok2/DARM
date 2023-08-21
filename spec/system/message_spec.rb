require 'rails_helper'
RSpec.describe Topic, type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    visit new_user_session_path
    fill_in 'user[email]', with: 'user22@gmail.com'
    fill_in 'user[password]', with: 'passpass'
    click_button 'ログイン'
  end
  
  describe'メッセージ' do
    context 'ログイン中の場合' do
      it 'メッセージボタンが表示されてメッセージ送信ができること' do
        click_link 'マイページ'
        binding.pry
        find('.bi bi-envelope-heart').click
        fill_in 'message[body]', with: 'Hi!'
        find('.soushin').click
        expect(page).to have_content "Hi!"
      end
    end
  end
end
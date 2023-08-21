require 'rails_helper'
RSpec.describe Topic, type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user[email]', with: 'user22@gmail.com'
    fill_in 'user[password]', with: 'passpass'
    click_button 'ログイン'
  end
  describe 'トピック' do
    context 'ログイン中の場合' do
      it '作成ができること' do
        click_link 'TOPICS'
        find('.btn.btn-primary[data-toggle="modal"][data-target="#modal1"]').click
        fill_in 'topic[name]', with: 'LOVELYZ'
        fill_in 'topic[introduce]', with: 'LOVELYZ！！！'
        attach_file 'topic[image]', File.join(Rails.root, 'spec/fixtures/images/image11.jpg')
        fill_in 'topic[youtube]', with: 'QlA18C7WtJI'
        click_button 'create_topic_button'
        expect(page).to have_content "LOVELYZ"
      end


      it 'トピックの閲覧ができること' do
        click_link 'TOPICS'
        find('.btn.btn-primary[data-toggle="modal"][data-target="#modal1"]').click
        fill_in 'topic[name]', with: 'LOVELYZ'
        fill_in 'topic[introduce]', with: 'LOVELYZ！！！'
        attach_file 'topic[image]', File.join(Rails.root, 'spec/fixtures/images/image11.jpg')
        fill_in 'topic[youtube]', with: 'QlA18C7WtJI'
        click_button 'create_topic_button'
        click_link 'LOVELYZ'
        expect(page).to have_content "LOVELYZ"
      end
    end
  end
end